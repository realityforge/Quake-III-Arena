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
// cg_info.c -- display information while data is being loading

#include "cg_local.h"

#define MAX_LOADING_PLAYER_ICONS 16
#define MAX_LOADING_ITEM_ICONS 26

static int loadingPlayerIconCount;
static int loadingItemIconCount;
static qhandle_t loadingPlayerIcons[MAX_LOADING_PLAYER_ICONS];
static qhandle_t loadingItemIcons[MAX_LOADING_ITEM_ICONS];

static void CG_DrawLoadingIcons()
{
    for (int n = 0; n < loadingPlayerIconCount; n++) {
        const int x = 16 + n * 78;
        const int y = 324 - 40;
        CG_DrawPic(x, y, 64, 64, loadingPlayerIcons[n]);
    }

    for (int n = 0; n < loadingItemIconCount; n++) {
        const int y = 400 - 40 + (n >= 13 ? 40 : 0);
        const int x = 16 + n % 13 * 48;
        CG_DrawPic(x, y, 32, 32, loadingItemIcons[n]);
    }
}

void CG_LoadingString(const char* s)
{
    strncpyz(cg.infoScreenText, s, sizeof(cg.infoScreenText));
    trap_UpdateScreen();
}

void CG_LoadingItem(const int itemNum)
{
    const gitem_t* item = &bg_itemlist[itemNum];

    if (item->icon && loadingItemIconCount < MAX_LOADING_ITEM_ICONS) {
        loadingItemIcons[loadingItemIconCount++] = trap_R_RegisterShaderNoMip(item->icon);
    }

    CG_LoadingString(item->pickup_name);
}

void CG_LoadingClient(int clientNum)
{
    char personality[MAX_QPATH];
    char model[MAX_QPATH];
    char iconName[MAX_QPATH];

    const char* info = CG_ConfigString(CS_PLAYERS + clientNum);

    if (loadingPlayerIconCount < MAX_LOADING_PLAYER_ICONS) {
        strncpyz(model, Info_ValueForKey(info, "model"), sizeof(model));
        char* skin = strrchr(model, '/');
        if (NULL != skin) {
            *skin++ = '\0';
        } else {
            skin = "default";
        }

        Com_sprintf(iconName, sizeof(iconName), "models/players/%s/icon_%s.png", model, skin);

        loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip(iconName);
        if (!loadingPlayerIcons[loadingPlayerIconCount]) {
            Com_sprintf(iconName, sizeof(iconName), "models/players/characters/%s/icon_%s.png", model, skin);
            loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip(iconName);
        }
        if (!loadingPlayerIcons[loadingPlayerIconCount]) {
            Com_sprintf(iconName, sizeof(iconName), "models/players/%s/icon_%s.png", DEFAULT_MODEL, "default");
            loadingPlayerIcons[loadingPlayerIconCount] = trap_R_RegisterShaderNoMip(iconName);
        }
        if (loadingPlayerIcons[loadingPlayerIconCount]) {
            loadingPlayerIconCount++;
        }
    }

    strncpyz(personality, Info_ValueForKey(info, "n"), sizeof(personality));
    Q_CleanStr(personality);

    if (GT_SINGLE_PLAYER == cgs.gametype) {
        trap_S_RegisterSound(va("sound/player/announce/%s.wav", personality), true);
    }

    CG_LoadingString(personality);
}

/*
====================
CG_DrawInformation

Draw all the status / pacifier stuff during level loading
====================
*/
void CG_DrawInformation()
{
    const char* info = CG_ConfigString(CS_SERVERINFO);
    const char* sysInfo = CG_ConfigString(CS_SYSTEMINFO);

    const char* mapname = Info_ValueForKey(info, "mapname");
    qhandle_t levelshot = trap_R_RegisterShaderNoMip(va("levelshots/%s", mapname));
    if (!levelshot) {
        levelshot = trap_R_RegisterShaderNoMip("menu/art/unknownmap");
    }
    trap_R_SetColor(NULL);
    CG_DrawPic(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, levelshot);

    // blend a detail texture over it
    const qhandle_t detail = trap_R_RegisterShader("levelShotDetail");
    trap_R_DrawStretchPic(0, 0, cgs.glconfig.vidWidth, cgs.glconfig.vidHeight, 0, 0, 2.5, 2, detail);

    // draw the icons of things as they are loaded
    CG_DrawLoadingIcons();

    // the first 150 rows are reserved for the client connection
    // screen to write into
    if (cg.infoScreenText[0]) {
        UI_DrawProportionalString(320, 128 - 32, va("Loading... %s", cg.infoScreenText),
                                  UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
    } else {
        UI_DrawProportionalString(320, 128 - 32, "Awaiting snapshot...",
                                  UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
    }

    // draw info string information

    int y = 180 - 32;

    // don't print server lines if playing a local game
    char buf[1024];

    trap_Cvar_VariableStringBuffer("sv_running", buf, sizeof(buf));
    if (!atoi(buf)) {
        // server hostname
        strncpyz(buf, Info_ValueForKey(info, "sv_hostname"), sizeof(buf));
        Q_CleanStr(buf);
        UI_DrawProportionalString(320, y, buf,
                                  UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
        y += PROP_HEIGHT;

        // pure server
        const char* sv_pure = Info_ValueForKey(sysInfo, "sv_pure");
        if (sv_pure[0] == '1') {
            UI_DrawProportionalString(320, y, "Pure Server", UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
            y += PROP_HEIGHT;
        }

        // server-specific message of the day
        const char* motd = CG_ConfigString(CS_MOTD);
        if (motd[0]) {
            UI_DrawProportionalString(320, y, motd, UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
            y += PROP_HEIGHT;
        }

        // some extra space after hostname and motd
        y += 10;
    }

    // map-specific message (long map name)
    const char* message = CG_ConfigString(CS_MESSAGE);
    if (message[0]) {
        UI_DrawProportionalString(320, y, message, UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
        y += PROP_HEIGHT;
    }

    // cheats warning
    const char* sv_cheats = Info_ValueForKey(sysInfo, "sv_cheats");
    if (sv_cheats[0] == '1') {
        UI_DrawProportionalString(320, y, "CHEATS ARE ENABLED", UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
        y += PROP_HEIGHT;
    }

    const char* game_type;
    // game type
    switch (cgs.gametype) {
    case GT_FFA:
        game_type = "Free For All";
        break;
    case GT_SINGLE_PLAYER:
        game_type = "Single Player";
        break;
    case GT_TOURNAMENT:
        game_type = "Tournament";
        break;
    case GT_TEAM:
        game_type = "Team Deathmatch";
        break;
    case GT_CTF:
        game_type = "Capture The Flag";
        break;
#ifdef TEAMARENA
    case GT_1FCTF:
        game_type = "One Flag CTF";
        break;
    case GT_OBELISK:
        game_type = "Overload";
        break;
    case GT_HARVESTER:
        game_type = "Harvester";
        break;
#endif
    default:
        game_type = "Unknown Gametype";
        break;
    }
    UI_DrawProportionalString(320, y, game_type, UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
    y += PROP_HEIGHT;

    const int timelimit = atoi(Info_ValueForKey(info, "timelimit"));
    if (0 != timelimit) {
        UI_DrawProportionalString(320, y, va("timelimit %i", timelimit), UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
        y += PROP_HEIGHT;
    }

    if (cgs.gametype < GT_CTF) {
        const int fraglimit = atoi(Info_ValueForKey(info, "fraglimit"));
        if (0 != fraglimit) {
            UI_DrawProportionalString(320, y, va("fraglimit %i", fraglimit), UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
            y += PROP_HEIGHT;
        }
    }

    if (cgs.gametype >= GT_CTF) {
        const int capturelimit = atoi(Info_ValueForKey(info, "capturelimit"));
        if (0 != capturelimit) {
            UI_DrawProportionalString(320, y, va("capturelimit %i", capturelimit), UI_CENTER | UI_SMALLFONT | UI_DROPSHADOW, colorWhite);
        }
    }
}
