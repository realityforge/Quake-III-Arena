/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Quake III Arena source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
// cg_consolecmds.c -- text commands typed in at the local console, or
// executed by a key binding

#include "cg_local.h"
#include "lang_util.h"
#include "server_commands.h"
#ifdef TEAMARENA
#include "ui_shared.h"
#include "voicechat.h"
#include "ui/menudef.h"

extern menuDef_t* menuScoreboard;
#endif

static void CG_TargetCommand_f()
{
    int targetNum;
    char test[4];

    targetNum = CG_CrosshairPlayer();
    if (!targetNum) {
        return;
    }

    trap_Argv(1, test, 4);
    trap_SendConsoleCommand(va("gc %i %i", targetNum, atoi(test)));
}

static void CG_SizeUp_f()
{
    trap_Cvar_Set("cg_viewsize", va("%i", (int)(cg_viewsize.integer + 10)));
}

static void CG_SizeDown_f()
{
    trap_Cvar_Set("cg_viewsize", va("%i", (int)(cg_viewsize.integer - 10)));
}

/*
=============
CG_Viewpos_f

Debugging command to print the current position
=============
*/
static void CG_Viewpos_f()
{
    CG_Printf("(%i %i %i) : %i\n", (int)cg.refdef.vieworg[0],
              (int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2],
              (int)cg.refdefViewAngles[YAW]);
}

static void CG_ScoresDown_f()
{

#ifdef TEAMARENA
    CG_BuildSpectatorString();
#endif
    if (cg.scoresRequestTime + 2000 < cg.time) {
        // the scores are more than two seconds out of data,
        // so request new ones
        cg.scoresRequestTime = cg.time;
        trap_SendClientCommand(SRVCMD_SCORE);

        // leave the current scores up if they were already
        // displayed, but if this is the first hit, clear them out
        if (!cg.showScores) {
            cg.showScores = true;
            cg.numScores = 0;
        }
    } else {
        // show the cached contents even if they just pressed if it
        // is within two seconds
        cg.showScores = true;
    }
}

static void CG_ScoresUp_f()
{
    if (cg.showScores) {
        cg.showScores = false;
        cg.scoreFadeTime = cg.time;
    }
}

#ifdef TEAMARENA
extern menuDef_t* menuScoreboard;
void Menu_Reset(void); // FIXME: add to right include file

static void CG_LoadHud_f()
{
    char buff[1024];
    const char* hudSet;
    memset(buff, 0, sizeof(buff));

    String_Init();
    Menu_Reset();

    trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
    hudSet = buff;
    if (hudSet[0] == '\0') {
        hudSet = "ui/hud.txt";
    }

    CG_LoadMenus(hudSet);
    menuScoreboard = NULL;
}

static void CG_scrollScoresDown_f()
{
    if (menuScoreboard && cg.scoreBoardShowing) {
        Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, true);
        Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, true);
        Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, true);
    }
}

static void CG_scrollScoresUp_f()
{
    if (menuScoreboard && cg.scoreBoardShowing) {
        Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, false);
        Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, false);
        Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, false);
    }
}

static void CG_spWin_f()
{
    trap_Cvar_Set("cg_cameraOrbit", "2");
    trap_Cvar_Set("cg_cameraOrbitDelay", "35");
    trap_Cvar_Set("cg_thirdPerson", "1");
    trap_Cvar_Set("cg_thirdPersonAngle", "0");
    trap_Cvar_Set("cg_thirdPersonRange", "100");
    CG_AddBufferedSound(cgs.media.winnerSound);
    // trap_S_StartLocalSound(cgs.media.winnerSound, CHAN_ANNOUNCER);
    CG_CenterPrint("YOU WIN!", SCREEN_HEIGHT * .30, 0);
}

static void CG_spLose_f()
{
    trap_Cvar_Set("cg_cameraOrbit", "2");
    trap_Cvar_Set("cg_cameraOrbitDelay", "35");
    trap_Cvar_Set("cg_thirdPerson", "1");
    trap_Cvar_Set("cg_thirdPersonAngle", "0");
    trap_Cvar_Set("cg_thirdPersonRange", "100");
    CG_AddBufferedSound(cgs.media.loserSound);
    // trap_S_StartLocalSound(cgs.media.loserSound, CHAN_ANNOUNCER);
    CG_CenterPrint("YOU LOSE...", SCREEN_HEIGHT * .30, 0);
}

#endif

static void CG_TellTarget_f()
{
    int clientNum;
    char command[128];
    char message[128];

    clientNum = CG_CrosshairPlayer();
    if (clientNum == -1) {
        return;
    }

    trap_Args(message, sizeof(message));
    Com_sprintf(command, sizeof(command), "tell %i %s", clientNum, message);
    trap_SendClientCommand(command);
}

static void CG_TellAttacker_f()
{
    int clientNum;
    char command[128];
    char message[128];

    clientNum = CG_LastAttacker();
    if (clientNum == -1) {
        return;
    }

    trap_Args(message, sizeof(message));
    Com_sprintf(command, sizeof(command), "tell %i %s", clientNum, message);
    trap_SendClientCommand(command);
}

#ifdef TEAMARENA
static void CG_VoiceTellTarget_f()
{
    int clientNum;
    char command[128];
    char message[128];

    clientNum = CG_CrosshairPlayer();
    if (clientNum == -1) {
        return;
    }

    trap_Args(message, sizeof(message));
    Com_sprintf(command, sizeof(command), SRVCMD_VTELL " %i %s", clientNum, message);
    trap_SendClientCommand(command);
}

static void CG_VoiceTellAttacker_f()
{
    int clientNum;
    char command[128];
    char message[128];

    clientNum = CG_LastAttacker();
    if (clientNum == -1) {
        return;
    }

    trap_Args(message, sizeof(message));
    Com_sprintf(command, sizeof(command), SRVCMD_VTELL " %i %s", clientNum, message);
    trap_SendClientCommand(command);
}

static void CG_NextTeamMember_f()
{
    CG_SelectNextPlayer();
}

static void CG_PrevTeamMember_f()
{
    CG_SelectPrevPlayer();
}

// ASS U ME's enumeration order as far as task specific orders, OFFENSE is zero, CAMP is last
//
static void CG_NextOrder_f()
{
    clientInfo_t* ci = cgs.clientinfo + cg.snap->ps.clientNum;
    if (ci) {
        if (!ci->teamLeader && sortedTeamPlayers[cg_currentSelectedPlayer.integer] != cg.snap->ps.clientNum) {
            return;
        }
    }
    if (cgs.currentOrder < TEAMTASK_CAMP) {
        cgs.currentOrder++;

        if (cgs.currentOrder == TEAMTASK_RETRIEVE) {
            if (!CG_OtherTeamHasFlag()) {
                cgs.currentOrder++;
            }
        }

        if (cgs.currentOrder == TEAMTASK_ESCORT) {
            if (!CG_YourTeamHasFlag()) {
                cgs.currentOrder++;
            }
        }

    } else {
        cgs.currentOrder = TEAMTASK_OFFENSE;
    }
    cgs.orderPending = true;
    cgs.orderTime = cg.time + 3000;
}

static void CG_ConfirmOrder_f()
{
    trap_SendConsoleCommand(va("cmd " SRVCMD_VTELL " %d %s\n", cgs.acceptLeader, VOICECHAT_YES));
    trap_SendConsoleCommand("+button5; wait; -button5");
    if (cg.time < cgs.acceptOrderTime) {
        trap_SendClientCommand(va("teamtask %d\n", cgs.acceptTask));
        cgs.acceptOrderTime = 0;
    }
}

static void CG_DenyOrder_f()
{
    trap_SendConsoleCommand(va("cmd " SRVCMD_VTELL " %d %s\n", cgs.acceptLeader, VOICECHAT_NO));
    trap_SendConsoleCommand("+button6; wait; -button6");
    if (cg.time < cgs.acceptOrderTime) {
        cgs.acceptOrderTime = 0;
    }
}

static void CG_TaskOffense_f()
{
    if (cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF) {
        trap_SendConsoleCommand(va("cmd " SRVCMD_VSAY_TEAM " %s\n", VOICECHAT_ONGETFLAG));
    } else {
        trap_SendConsoleCommand(va("cmd " SRVCMD_VSAY_TEAM " %s\n", VOICECHAT_ONOFFENSE));
    }
    trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_OFFENSE));
}

static void CG_TaskDefense_f()
{
    trap_SendConsoleCommand(va("cmd " SRVCMD_VSAY_TEAM " %s\n", VOICECHAT_ONDEFENSE));
    trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_DEFENSE));
}

static void CG_TaskPatrol_f()
{
    trap_SendConsoleCommand(va("cmd " SRVCMD_VSAY_TEAM " %s\n", VOICECHAT_ONPATROL));
    trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_PATROL));
}

static void CG_TaskCamp_f()
{
    trap_SendConsoleCommand(va("cmd " SRVCMD_VSAY_TEAM " %s\n", VOICECHAT_ONCAMPING));
    trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_CAMP));
}

static void CG_TaskFollow_f()
{
    trap_SendConsoleCommand(va("cmd " SRVCMD_VSAY_TEAM " %s\n", VOICECHAT_ONFOLLOW));
    trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_FOLLOW));
}

static void CG_TaskRetrieve_f()
{
    trap_SendConsoleCommand(va("cmd " SRVCMD_VSAY_TEAM " %s\n", VOICECHAT_ONRETURNFLAG));
    trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_RETRIEVE));
}

static void CG_TaskEscort_f()
{
    trap_SendConsoleCommand(va("cmd " SRVCMD_VSAY_TEAM " %s\n", VOICECHAT_ONFOLLOWCARRIER));
    trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_ESCORT));
}

static void CG_TaskOwnFlag_f()
{
    trap_SendConsoleCommand(va("cmd " SRVCMD_VSAY_TEAM " %s\n", VOICECHAT_IHAVEFLAG));
}

static void CG_TauntKillInsult_f()
{
    trap_SendConsoleCommand("cmd " SRVCMD_VSAY " " VOICECHAT_KILLINSULT "\n");
}

static void CG_TauntPraise_f()
{
    trap_SendConsoleCommand("cmd " SRVCMD_VSAY " " VOICECHAT_PRAISE "\n");
}

static void CG_TauntTaunt_f()
{
    trap_SendConsoleCommand("cmd vtaunt\n");
}

static void CG_TauntDeathInsult_f()
{
    trap_SendConsoleCommand("cmd " SRVCMD_VSAY " " VOICECHAT_DEATHINSULT "\n");
}

static void CG_TauntGauntlet_f()
{
    trap_SendConsoleCommand("cmd " SRVCMD_VSAY " " VOICECHAT_KILLGAUNTLET "\n");
}

static void CG_TaskSuicide_f()
{
    int clientNum;
    char command[128];

    clientNum = CG_CrosshairPlayer();
    if (clientNum == -1) {
        return;
    }

    Com_sprintf(command, sizeof(command), "tell %i suicide", clientNum);
    trap_SendClientCommand(command);
}

#endif

static void CG_StartOrbit_f()
{
    char var[MAX_TOKEN_CHARS];

    trap_Cvar_VariableStringBuffer("developer", var, sizeof(var));
    if (!atoi(var)) {
        return;
    }
    if (cg_cameraOrbit.value != 0) {
        trap_Cvar_Set("cg_cameraOrbit", "0");
        trap_Cvar_Set("cg_thirdPerson", "0");
    } else {
        trap_Cvar_Set("cg_cameraOrbit", "5");
        trap_Cvar_Set("cg_thirdPerson", "1");
        trap_Cvar_Set("cg_thirdPersonAngle", "0");
        trap_Cvar_Set("cg_thirdPersonRange", "100");
    }
}

typedef struct {
    char* cmd;
    void (*function)();
} consoleCommand_t;

static consoleCommand_t commands[] = {
    { "testgun", CG_TestGun_f },
    { "testmodel", CG_TestModel_f },
    { "nextframe", CG_TestModelNextFrame_f },
    { "prevframe", CG_TestModelPrevFrame_f },
    { "nextskin", CG_TestModelNextSkin_f },
    { "prevskin", CG_TestModelPrevSkin_f },
    { "viewpos", CG_Viewpos_f },
    { "+scores", CG_ScoresDown_f },
    { "-scores", CG_ScoresUp_f },
    { "+zoom", CG_ZoomDown_f },
    { "-zoom", CG_ZoomUp_f },
    { "sizeup", CG_SizeUp_f },
    { "sizedown", CG_SizeDown_f },
    { "weapnext", CG_NextWeapon_f },
    { "weapprev", CG_PrevWeapon_f },
    { "weapon", CG_Weapon_f },
    { "tell_target", CG_TellTarget_f },
    { "tell_attacker", CG_TellAttacker_f },
    { "tcmd", CG_TargetCommand_f },
#ifdef TEAMARENA
    { "vtell_target", CG_VoiceTellTarget_f },
    { "vtell_attacker", CG_VoiceTellAttacker_f },
    { "loadhud", CG_LoadHud_f },
    { "nextTeamMember", CG_NextTeamMember_f },
    { "prevTeamMember", CG_PrevTeamMember_f },
    { "nextOrder", CG_NextOrder_f },
    { "confirmOrder", CG_ConfirmOrder_f },
    { "denyOrder", CG_DenyOrder_f },
    { "taskOffense", CG_TaskOffense_f },
    { "taskDefense", CG_TaskDefense_f },
    { "taskPatrol", CG_TaskPatrol_f },
    { "taskCamp", CG_TaskCamp_f },
    { "taskFollow", CG_TaskFollow_f },
    { "taskRetrieve", CG_TaskRetrieve_f },
    { "taskEscort", CG_TaskEscort_f },
    { "taskSuicide", CG_TaskSuicide_f },
    { "taskOwnFlag", CG_TaskOwnFlag_f },
    { "tauntKillInsult", CG_TauntKillInsult_f },
    { "tauntPraise", CG_TauntPraise_f },
    { "tauntTaunt", CG_TauntTaunt_f },
    { "tauntDeathInsult", CG_TauntDeathInsult_f },
    { "tauntGauntlet", CG_TauntGauntlet_f },
    { "spWin", CG_spWin_f },
    { "spLose", CG_spLose_f },
    { "scoresDown", CG_scrollScoresDown_f },
    { "scoresUp", CG_scrollScoresUp_f },
#endif
    { "startOrbit", CG_StartOrbit_f },
    { SRVCMD_LOAD_DEFERRED, CG_LoadDeferredPlayers }
};

/*
=================
CG_ConsoleCommand

The string has been tokenized and can be retrieved with
Cmd_Argc() / Cmd_Argv()
=================
*/
bool CG_ConsoleCommand()
{
    const char* cmd = CG_Argv(0);
    for (int i = 0; i < COUNT_OF(commands); i++) {
        if (!Q_stricmp(cmd, commands[i].cmd)) {
            commands[i].function();
            return true;
        }
    }

    return false;
}

/*
=================
CG_InitConsoleCommands

Let the client system know about all of our commands
so it can perform tab completion
=================
*/
void CG_InitConsoleCommands()
{
    for (int i = 0; i < COUNT_OF(commands); i++) {
        trap_AddCommand(commands[i].cmd);
    }

    // the game server will interpret these commands, which will be automatically
    // forwarded to the server after they are not recognized locally
    trap_AddCommand(SRVCMD_KILL);
    trap_AddCommand(SRVCMD_SAY);
    trap_AddCommand(SRVCMD_SAY_TEAM);
    trap_AddCommand(SRVCMD_TELL);
    trap_AddCommand(SRVCMD_GIVE);
    trap_AddCommand(SRVCMD_GOD);
    trap_AddCommand(SRVCMD_NOTARGET);
    trap_AddCommand(SRVCMD_NOCLIP);
    trap_AddCommand(SRVCMD_TEAM);
    trap_AddCommand(SRVCMD_FOLLOW);
    trap_AddCommand(SRVCMD_FOLLOWNEXT);
    trap_AddCommand(SRVCMD_FOLLOWPREV);
    trap_AddCommand(SRVCMD_LEVELSHOT);
    trap_AddCommand(SRVCMD_ADDBOT);
    trap_AddCommand(SRVCMD_SETVIEWPOS);
    trap_AddCommand(SRVCMD_CALLVOTE);
    trap_AddCommand(SRVCMD_VOTE);
    trap_AddCommand(SRVCMD_CALLTEAMVOTE);
    trap_AddCommand(SRVCMD_TEAMVOTE);
    trap_AddCommand(SRVCMD_STATS);
    trap_AddCommand(SRVCMD_TEAMTASK);
    trap_AddCommand(SRVCMD_LOAD_DEFERRED);
#ifdef TEAMARENA
    trap_AddCommand(SRVCMD_VSAY);
    trap_AddCommand(SRVCMD_VSAY_TEAM);
    trap_AddCommand(SRVCMD_VTELL);
    trap_AddCommand(SRVCMD_VTAUNT);
    trap_AddCommand(SRVCMD_VOSAY);
    trap_AddCommand(SRVCMD_VOSAY_TEAM);
    trap_AddCommand(SRVCMD_VOTELL);
#endif
}
