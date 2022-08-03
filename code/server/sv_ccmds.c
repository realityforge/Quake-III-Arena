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

#include "server_local.h"
#include "lang_util.h"

/*
===============================================================================

OPERATOR CONSOLE ONLY COMMANDS

These commands can only be entered from stdin or by a remote operator datagram
===============================================================================
*/

/*
==================
SV_GetPlayerByHandle

Returns the player with player id or name from Cmd_Argv(1)
==================
*/
static client_t* SV_GetPlayerByHandle()
{
    client_t* cl;
    int i;
    char* s;
    char cleanName[64];

    // make sure server is running
    if (!com_sv_running->integer) {
        return NULL;
    }

    if (Cmd_Argc() < 2) {
        Com_Printf("No player specified.\n");
        return NULL;
    }

    s = Cmd_Argv(1);

    // Check whether this is a numeric player handle
    for (i = 0; s[i] >= '0' && s[i] <= '9'; i++)
        ;

    if (!s[i]) {
        int plid = atoi(s);

        // Check for numeric playerid match
        if (plid >= 0 && plid < sv_maxclients->integer) {
            cl = &svs.clients[plid];

            if (cl->state)
                return cl;
        }
    }

    // check for a name match
    for (i = 0, cl = svs.clients; i < sv_maxclients->integer; i++, cl++) {
        if (!cl->state) {
            continue;
        }
        if (!Q_stricmp(cl->name, s)) {
            return cl;
        }

        Q_strncpyz(cleanName, cl->name, sizeof(cleanName));
        Q_CleanStr(cleanName);
        if (!Q_stricmp(cleanName, s)) {
            return cl;
        }
    }

    Com_Printf("Player %s is not on the server\n", s);

    return NULL;
}

/*
==================
SV_GetPlayerByNum

Returns the player with idnum from Cmd_Argv(1)
==================
*/
static client_t* SV_GetPlayerByNum()
{
    client_t* cl;
    int i;
    int idnum;
    char* s;

    // make sure server is running
    if (!com_sv_running->integer) {
        return NULL;
    }

    if (Cmd_Argc() < 2) {
        Com_Printf("No player specified.\n");
        return NULL;
    }

    s = Cmd_Argv(1);

    for (i = 0; s[i]; i++) {
        if (s[i] < '0' || s[i] > '9') {
            Com_Printf("Bad slot number: %s\n", s);
            return NULL;
        }
    }
    idnum = atoi(s);
    if (idnum < 0 || idnum >= sv_maxclients->integer) {
        Com_Printf("Bad client slot: %i\n", idnum);
        return NULL;
    }

    cl = &svs.clients[idnum];
    if (!cl->state) {
        Com_Printf("Client %i is not active\n", idnum);
        return NULL;
    }
    return cl;
}

//=========================================================

/*
==================
SV_Map_f

Restart the server on a different map
==================
*/
static void SV_Map_f()
{
    char* cmd;
    char* map;
    bool killBots, cheat;
    char expanded[MAX_QPATH];
    char mapname[MAX_QPATH];

    map = Cmd_Argv(1);
    if (!map) {
        return;
    }

    // make sure the level exists before trying to change, so that
    // a typo at the server console won't end the game
    Com_sprintf(expanded, sizeof(expanded), "maps/%s.bsp", map);
    if (FS_ReadFile(expanded, NULL) == -1) {
        Com_Printf("Can't find map %s\n", expanded);
        return;
    }

    // force latched values to get set
    Cvar_Get("g_gametype", "0", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH);

    cmd = Cmd_Argv(0);
    if (Q_stricmpn(cmd, "sp", 2) == 0) {
        Cvar_SetValue("g_gametype", GT_SINGLE_PLAYER);
        Cvar_SetValue("g_doWarmup", 0);
        // may not set sv_maxclients directly, always set latched
        Cvar_SetLatched("sv_maxclients", "8");
        cmd += 2;
        if (!Q_stricmp(cmd, "devmap")) {
            cheat = true;
        } else {
            cheat = false;
        }
        killBots = true;
    } else {
        if (!Q_stricmp(cmd, "devmap")) {
            cheat = true;
            killBots = true;
        } else {
            cheat = false;
            killBots = false;
        }
        if (sv_gametype->integer == GT_SINGLE_PLAYER) {
            Cvar_SetValue("g_gametype", GT_FFA);
        }
    }

    // save the map name here cause on a map restart we reload the q3config.cfg
    // and thus nuke the arguments of the map command
    Q_strncpyz(mapname, map, sizeof(mapname));

    // start up the map
    SV_SpawnServer(mapname, killBots);

    // set the cheat value
    // if the level was started with "map <levelname>", then
    // cheats will not be allowed.  If started with "devmap <levelname>"
    // then cheats will be allowed
    if (cheat) {
        Cvar_Set("sv_cheats", "1");
    } else {
        Cvar_Set("sv_cheats", "0");
    }
}

/*
================
SV_MapRestart_f

Completely restarts a level, but doesn't send a new gamestate to the clients.
This allows fair starts with variable load times.
================
*/
static void SV_MapRestart_f()
{
    int i;
    client_t* client;
    char* denied;
    bool isBot;
    int delay;

    // make sure we aren't restarting twice in the same frame
    if (com_frameTime == sv.serverId) {
        return;
    }

    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    if (sv.restartTime) {
        return;
    }

    if (Cmd_Argc() > 1) {
        delay = atoi(Cmd_Argv(1));
    } else {
        delay = 5;
    }
    if (delay && !Cvar_VariableValue("g_doWarmup")) {
        sv.restartTime = sv.time + delay * 1000;
        SV_SetConfigstring(CS_WARMUP, va("%i", sv.restartTime));
        return;
    }

    // check for changes in variables that can't just be restarted
    // check for maxclients change
    if (sv_maxclients->modified || sv_gametype->modified) {
        char mapname[MAX_QPATH];

        Com_Printf("variable change -- restarting.\n");
        // restart the map the slow way
        Q_strncpyz(mapname, Cvar_VariableString("mapname"), sizeof(mapname));

        SV_SpawnServer(mapname, false);
        return;
    }

    // toggle the server bit so clients can detect that a
    // map_restart has happened
    svs.snapFlagServerBit ^= SNAPFLAG_SERVERCOUNT;

    // generate a new serverid
    // TTimo - don't update restartedserverId there, otherwise we won't deal correctly with multiple map_restart
    sv.serverId = com_frameTime;
    Cvar_Set("sv_serverid", va("%i", sv.serverId));

    // if a map_restart occurs while a client is changing maps, we need
    // to give them the correct time so that when they finish loading
    // they don't violate the backwards time check in cl_cgame.c
    for (i = 0; i < sv_maxclients->integer; i++) {
        if (svs.clients[i].state == CS_PRIMED) {
            svs.clients[i].oldServerTime = sv.restartTime;
        }
    }

    // reset all the vm data in place without changing memory allocation
    // note that we do NOT set sv.state = SS_LOADING, so configstrings that
    // had been changed from their default values will generate broadcast updates
    sv.state = SS_LOADING;
    sv.restarting = true;

    SV_RestartGameProgs();

    // run a few frames to allow everything to settle
    for (i = 0; i < 3; i++) {
        VM_Call(gvm, GAME_RUN_FRAME, sv.time);
        sv.time += 100;
        svs.time += 100;
    }

    sv.state = SS_GAME;
    sv.restarting = false;

    // connect and begin all the clients
    for (i = 0; i < sv_maxclients->integer; i++) {
        client = &svs.clients[i];

        // send the new gamestate to all connected clients
        if (client->state < CS_CONNECTED) {
            continue;
        }

        if (client->netchan.remoteAddress.type == NA_BOT) {
            isBot = true;
        } else {
            isBot = false;
        }

        // add the map_restart command
        SV_AddServerCommand(client, "map_restart\n");

        // connect the client again, without the firstTime flag
        denied = VM_ExplicitArgPtr(gvm, VM_Call(gvm, GAME_CLIENT_CONNECT, i, false, isBot));
        if (denied) {
            // this generally shouldn't happen, because the client
            // was connected before the level change
            SV_DropClient(client, denied);
            Com_Printf("SV_MapRestart_f(%d): dropped client %i - denied!\n", delay, i);
            continue;
        }

        if (client->state == CS_ACTIVE)
            SV_ClientEnterWorld(client, &client->lastUsercmd);
        else {
            // If we don't reset client->lastUsercmd and are restarting during map load,
            // the client will hang because we'll use the last Usercmd from the previous map,
            // which is wrong obviously.
            SV_ClientEnterWorld(client, NULL);
        }
    }

    // run another frame to allow things to look at all the players
    VM_Call(gvm, GAME_RUN_FRAME, sv.time);
    sv.time += 100;
    svs.time += 100;
}

//===============================================================

/*
==================
SV_Kick_f

Kick a user off of the server
==================
*/
static void SV_Kick_f()
{
    client_t* cl;
    int i;

    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    if (Cmd_Argc() != 2) {
        Com_Printf("Usage: kick <player name>\nkick all = kick everyone\nkick allbots = kick all bots\n");
        return;
    }

    cl = SV_GetPlayerByHandle();
    if (!cl) {
        if (!Q_stricmp(Cmd_Argv(1), "all")) {
            for (i = 0, cl = svs.clients; i < sv_maxclients->integer; i++, cl++) {
                if (!cl->state) {
                    continue;
                }
                if (cl->netchan.remoteAddress.type == NA_LOOPBACK) {
                    continue;
                }
                SV_DropClient(cl, "was kicked");
                cl->lastPacketTime = svs.time; // in case there is a funny zombie
            }
        } else if (!Q_stricmp(Cmd_Argv(1), "allbots")) {
            for (i = 0, cl = svs.clients; i < sv_maxclients->integer; i++, cl++) {
                if (!cl->state) {
                    continue;
                }
                if (cl->netchan.remoteAddress.type != NA_BOT) {
                    continue;
                }
                SV_DropClient(cl, "was kicked");
                cl->lastPacketTime = svs.time; // in case there is a funny zombie
            }
        }
        return;
    }
    if (cl->netchan.remoteAddress.type == NA_LOOPBACK) {
        Com_Printf("Cannot kick host player\n");
        return;
    }

    SV_DropClient(cl, "was kicked");
    cl->lastPacketTime = svs.time; // in case there is a funny zombie
}

/*
==================
SV_KickBots_f

Kick all bots off of the server
==================
*/
static void SV_KickBots_f()
{
    client_t* cl;
    int i;

    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    for (i = 0, cl = svs.clients; i < sv_maxclients->integer; i++, cl++) {
        if (!cl->state) {
            continue;
        }

        if (cl->netchan.remoteAddress.type != NA_BOT) {
            continue;
        }

        SV_DropClient(cl, "was kicked");
        cl->lastPacketTime = svs.time; // in case there is a funny zombie
    }
}
/*
==================
SV_KickAll_f

Kick all users off of the server
==================
*/
static void SV_KickAll_f()
{
    client_t* cl;
    int i;

    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    for (i = 0, cl = svs.clients; i < sv_maxclients->integer; i++, cl++) {
        if (!cl->state) {
            continue;
        }

        if (cl->netchan.remoteAddress.type == NA_LOOPBACK) {
            continue;
        }

        SV_DropClient(cl, "was kicked");
        cl->lastPacketTime = svs.time; // in case there is a funny zombie
    }
}

/*
==================
SV_KickNum_f

Kick a user off of the server
==================
*/
static void SV_KickNum_f()
{
    client_t* cl;

    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    if (Cmd_Argc() != 2) {
        Com_Printf("Usage: %s <client number>\n", Cmd_Argv(0));
        return;
    }

    cl = SV_GetPlayerByNum();
    if (!cl) {
        return;
    }
    if (cl->netchan.remoteAddress.type == NA_LOOPBACK) {
        Com_Printf("Cannot kick host player\n");
        return;
    }

    SV_DropClient(cl, "was kicked");
    cl->lastPacketTime = svs.time; // in case there is a funny zombie
}

/*
** SV_Strlen -- skips color escape codes
*/
static int SV_Strlen(const char* str)
{
    const char* s = str;
    int count = 0;

    while (*s) {
        if (Q_IsColorString(s)) {
            s += 2;
        } else {
            count++;
            s++;
        }
    }

    return count;
}

static void SV_Status_f()
{
    int i, j, l;
    client_t* cl;
    playerState_t* ps;
    const char* s;
    int ping;

    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    Com_Printf("map: %s\n", sv_mapname->string);

    Com_Printf("cl score ping name            address                                 rate \n");
    Com_Printf("-- ----- ---- --------------- --------------------------------------- -----\n");
    for (i = 0, cl = svs.clients; i < sv_maxclients->integer; i++, cl++) {
        if (!cl->state)
            continue;
        Com_Printf("%2i ", i);
        ps = SV_GameClientNum(i);
        Com_Printf("%5i ", ps->persistant[PERS_SCORE]);

        if (cl->state == CS_CONNECTED)
            Com_Printf("CON ");
        else if (cl->state == CS_ZOMBIE)
            Com_Printf("ZMB ");
        else {
            ping = cl->ping < 9999 ? cl->ping : 9999;
            Com_Printf("%4i ", ping);
        }

        Com_Printf("%s", cl->name);

        l = 16 - SV_Strlen(cl->name);
        j = 0;

        do {
            Com_Printf(" ");
            j++;
        } while (j < l);

        // TTimo adding a ^7 to reset the color
        s = NET_AdrToString(cl->netchan.remoteAddress);
        Com_Printf("^7%s", s);
        l = 39 - strlen(s);
        j = 0;

        do {
            Com_Printf(" ");
            j++;
        } while (j < l);

        Com_Printf(" %5i", cl->rate);

        Com_Printf("\n");
    }
    Com_Printf("\n");
}
#ifdef DEDICATED

static void SV_ConSay_f()
{
    char* p;
    char text[1024];

    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    if (Cmd_Argc() < 2) {
        return;
    }

    strcpy(text, "console: ");
    p = Cmd_Args();

    if (*p == '"') {
        p++;
        p[strlen(p) - 1] = 0;
    }

    strcat(text, p);

    Com_Printf("%s\n", text);
    SV_SendServerCommand(NULL, "chat \"%s\"", text);
}

static void SV_ConTell_f()
{
    char* p;
    char text[1024];
    client_t* cl;

    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    if (Cmd_Argc() < 3) {
        Com_Printf("Usage: tell <client number> <text>\n");
        return;
    }

    cl = SV_GetPlayerByNum();
    if (!cl) {
        return;
    }

    strcpy(text, "console_tell: ");
    p = Cmd_ArgsFrom(2);

    if (*p == '"') {
        p++;
        p[strlen(p) - 1] = 0;
    }

    strcat(text, p);

    Com_Printf("%s\n", text);
    SV_SendServerCommand(cl, "chat \"%s\"", text);
}

static void SV_ConSayto_f()
{
    char* p;
    char text[1024];
    client_t* cl;
    char* rawname;
    char name[MAX_NAME_LENGTH];
    char cleanName[MAX_NAME_LENGTH];
    client_t* saytocl;
    int i;

    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    if (Cmd_Argc() < 3) {
        Com_Printf("Usage: sayto <player name> <text>\n");
        return;
    }

    rawname = Cmd_Argv(1);

    // allowing special characters in the console
    // with hex strings for player names
    Com_FieldStringToPlayerName(name, MAX_NAME_LENGTH, rawname);

    saytocl = NULL;
    for (i = 0, cl = svs.clients; i < sv_maxclients->integer; i++, cl++) {
        if (!cl->state) {
            continue;
        }
        Q_strncpyz(cleanName, cl->name, sizeof(cleanName));
        Q_CleanStr(cleanName);

        if (!Q_stricmp(cleanName, name)) {
            saytocl = cl;
            break;
        }
    }
    if (!saytocl) {
        Com_Printf("No such player name: %s.\n", name);
        return;
    }

    strcpy(text, "console_sayto: ");
    p = Cmd_ArgsFrom(2);

    if (*p == '"') {
        p++;
        p[strlen(p) - 1] = 0;
    }

    strcat(text, p);

    Com_Printf("%s\n", text);
    SV_SendServerCommand(saytocl, "chat \"%s\"", text);
}

/*
==================
SV_Heartbeat_f

Also called by SV_DropClient, SV_DirectConnect, and SV_SpawnServer
==================
*/
void SV_Heartbeat_f()
{
    svs.nextHeartbeatTime = -9999999;
}

#endif

/*
===========
SV_Serverinfo_f

Examine the serverinfo string
===========
*/
static void SV_Serverinfo_f()
{
    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    Com_Printf("Server info settings:\n");
    Info_Print(Cvar_InfoString(CVAR_SERVERINFO));
}

/*
===========
SV_Systeminfo_f

Examine the systeminfo string
===========
*/
static void SV_Systeminfo_f()
{
    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    Com_Printf("System info settings:\n");
    Info_Print(Cvar_InfoString_Big(CVAR_SYSTEMINFO));
}

/*
===========
SV_DumpUser_f

Examine all a users info strings
===========
*/
static void SV_DumpUser_f()
{
    client_t* cl;

    // make sure server is running
    if (!com_sv_running->integer) {
        Com_Printf("Server is not running.\n");
        return;
    }

    if (Cmd_Argc() != 2) {
        Com_Printf("Usage: dumpuser <userid>\n");
        return;
    }

    cl = SV_GetPlayerByHandle();
    if (!cl) {
        return;
    }

    Com_Printf("userinfo\n");
    Com_Printf("--------\n");
    Info_Print(cl->userinfo);
}

static void SV_KillServer_f()
{
    SV_Shutdown("killserver");
}

//===========================================================

static void SV_CompleteMapName(char* args, int argNum)
{
    if (argNum == 2) {
        Field_CompleteFilename("maps", "bsp", true, false);
    }
}
#ifdef DEDICATED

static void SV_CompletePlayerName(char* args, int argNum)
{
    if (argNum == 2) {
        char names[MAX_CLIENTS][MAX_NAME_LENGTH];
        const char* namesPtr[MAX_CLIENTS];
        client_t* cl;
        int i;
        int nameCount;
        int clientCount;

        nameCount = 0;
        clientCount = sv_maxclients->integer;

        for (i = 0, cl = svs.clients; i < clientCount; i++, cl++) {
            if (!cl->state) {
                continue;
            }
            if (i >= MAX_CLIENTS) {
                break;
            }
            Q_strncpyz(names[nameCount], cl->name, sizeof(names[nameCount]));
            Q_CleanStr(names[nameCount]);

            namesPtr[nameCount] = names[nameCount];

            nameCount++;
        }
        qsort((void*)namesPtr, nameCount, sizeof(namesPtr[0]), Com_strCompare);

        Field_CompletePlayerName(namesPtr, nameCount);
    }
}
#endif

void SV_AddOperatorCommands()
{
    static bool initialized;

    if (initialized) {
        return;
    }
    initialized = true;

    Cmd_AddCommand("kick", SV_Kick_f);
    Cmd_AddCommand("kickbots", SV_KickBots_f);
    Cmd_AddCommand("kickall", SV_KickAll_f);
    Cmd_AddCommand("kicknum", SV_KickNum_f);
    Cmd_AddCommand("clientkick", SV_KickNum_f); // Legacy command
    Cmd_AddCommand("status", SV_Status_f);
    Cmd_AddCommand("serverinfo", SV_Serverinfo_f);
    Cmd_AddCommand("systeminfo", SV_Systeminfo_f);
    Cmd_AddCommand("dumpuser", SV_DumpUser_f);
    Cmd_AddCommand("map_restart", SV_MapRestart_f);
    Cmd_AddCommand("sectorlist", SV_SectorList_f);
    Cmd_AddCommand("map", SV_Map_f);
    Cmd_SetCommandCompletionFunc("map", SV_CompleteMapName);
    Cmd_AddCommand("devmap", SV_Map_f);
    Cmd_SetCommandCompletionFunc("devmap", SV_CompleteMapName);
    Cmd_AddCommand("spmap", SV_Map_f);
    Cmd_SetCommandCompletionFunc("spmap", SV_CompleteMapName);
    Cmd_AddCommand("spdevmap", SV_Map_f);
    Cmd_SetCommandCompletionFunc("spdevmap", SV_CompleteMapName);
    Cmd_AddCommand("killserver", SV_KillServer_f);
#ifdef DEDICATED
    Cmd_AddCommand("heartbeat", SV_Heartbeat_f);
    Cmd_AddCommand("say", SV_ConSay_f);
    Cmd_AddCommand("tell", SV_ConTell_f);
    Cmd_AddCommand("sayto", SV_ConSayto_f);
    Cmd_SetCommandCompletionFunc("sayto", SV_CompletePlayerName);
#endif
}
