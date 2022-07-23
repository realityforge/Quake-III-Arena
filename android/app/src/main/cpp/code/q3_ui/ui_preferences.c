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
//
/*
=======================================================================

GAME OPTIONS MENU

=======================================================================
*/

#include "ui_local.h"

#define ART_FRAMEL "menu/art/frame2_l"
#define ART_FRAMER "menu/art/frame1_r"
#define ART_BACK0 "menu/art/back_0"
#define ART_BACK1 "menu/art/back_1"

#define PREFERENCES_X_POS 360

#define ID_CROSSHAIR 127
#define ID_SIMPLEITEMS 128
#define ID_EJECTINGBRASS 129
#define ID_WALLMARKS 130
#define ID_IDENTIFYTARGET 131
#define ID_FORCEMODEL 132
#define ID_DRAWTEAMOVERLAY 133
#define ID_LASERSIGHT 134
#define ID_DRAWHUD 135
#define ID_HOLSTER2D 136
#define ID_GORE 137
#define ID_SHOWINHAND 138
#define ID_SELECTORWITHHUD 139
#define ID_SHOWCONSOLE 140
#define ID_BACK 141

#define NUM_CROSSHAIRS 10
#define NUM_GORE 4

typedef struct {
    menuframework_s menu;

    menutext_s banner;
    menubitmap_s framel;
    menubitmap_s framer;

    menulist_s crosshair;
    menuradiobutton_s lasersight;
    menuradiobutton_s simpleitems;
    menuradiobutton_s brass;
    menuradiobutton_s wallmarks;
    menuradiobutton_s identifytarget;
    menuradiobutton_s forcemodel;
    menulist_s drawteamoverlay;
    menulist_s drawhud;
    menuradiobutton_s holster2d;
    menulist_s gore;
    menuradiobutton_s showinhand;
    menuradiobutton_s selectorwithhud;
    menuradiobutton_s showconsole;
    menubitmap_s back;

    qhandle_t crosshairShader[NUM_CROSSHAIRS];
} preferences_t;

static preferences_t s_preferences;

static const char* hud_names[] = {
    "Off",
    "Floating",
    "Fixed to View",
    NULL
};

static const char* teamoverlay_names[] = {
    "Off",
    "Upper Right",
    "Lower Right",
    "Lower Left",
    NULL
};

static const char* s_gore[] = {
    "None",
    "Blood Only",
    "Blood & Gibs (Default)",
    "Extra Gore (Performance Hit)",
    NULL
};

static void Preferences_SetMenuItems(void)
{
    s_preferences.crosshair.curvalue = (int)trap_Cvar_VariableValue("cg_drawCrosshair") % NUM_CROSSHAIRS;
    s_preferences.lasersight.curvalue = trap_Cvar_VariableValue("vr_lasersight") != 0;
    s_preferences.simpleitems.curvalue = trap_Cvar_VariableValue("cg_simpleItems") != 0;
    s_preferences.brass.curvalue = trap_Cvar_VariableValue("cg_brassTime") != 0;
    s_preferences.wallmarks.curvalue = trap_Cvar_VariableValue("cg_marks") != 0;
    s_preferences.identifytarget.curvalue = trap_Cvar_VariableValue("cg_drawCrosshairNames") != 0;
    s_preferences.forcemodel.curvalue = trap_Cvar_VariableValue("cg_forcemodel") != 0;
    s_preferences.drawteamoverlay.curvalue = Com_Clamp(0, 3, trap_Cvar_VariableValue("cg_drawTeamOverlay"));
    s_preferences.drawhud.curvalue = trap_Cvar_VariableValue("vr_hudDrawStatus");
    s_preferences.holster2d.curvalue = trap_Cvar_VariableValue("cg_weaponSelectorSimple2DIcons") != 0;
    s_preferences.gore.curvalue = trap_Cvar_VariableValue("vr_goreLevel");
    s_preferences.showinhand.curvalue = trap_Cvar_VariableValue("vr_showItemInHand") != 0;
    s_preferences.selectorwithhud.curvalue = trap_Cvar_VariableValue("vr_weaponSelectorWithHud") != 0;
    s_preferences.showconsole.curvalue = trap_Cvar_VariableValue("vr_showConsoleMessages") != 0;
}

static void Preferences_Event(void* ptr, int notification)
{
    if (notification != QM_ACTIVATED) {
        return;
    }

    switch (((menucommon_s*)ptr)->id) {
    case ID_CROSSHAIR:
        trap_Cvar_SetValue("cg_drawCrosshair", s_preferences.crosshair.curvalue);
        break;

    case ID_SIMPLEITEMS:
        trap_Cvar_SetValue("cg_simpleItems", s_preferences.simpleitems.curvalue);
        break;

    case ID_EJECTINGBRASS:
        if (s_preferences.brass.curvalue)
            trap_Cvar_Reset("cg_brassTime");
        else
            trap_Cvar_SetValue("cg_brassTime", 0);
        break;

    case ID_WALLMARKS:
        trap_Cvar_SetValue("cg_marks", s_preferences.wallmarks.curvalue);
        break;

    case ID_IDENTIFYTARGET:
        trap_Cvar_SetValue("cg_drawCrosshairNames", s_preferences.identifytarget.curvalue);
        break;

    case ID_FORCEMODEL:
        trap_Cvar_SetValue("cg_forcemodel", s_preferences.forcemodel.curvalue);
        break;

    case ID_DRAWTEAMOVERLAY:
        trap_Cvar_SetValue("cg_drawTeamOverlay", s_preferences.drawteamoverlay.curvalue);
        break;

    case ID_LASERSIGHT:
        trap_Cvar_SetValue("vr_lasersight", s_preferences.lasersight.curvalue);
        break;

    case ID_DRAWHUD:
        trap_Cvar_SetValue("vr_hudDrawStatus", s_preferences.drawhud.curvalue);
        trap_Cvar_SetValue("cg_draw3dIcons", (s_preferences.drawhud.curvalue == 2) ? 0 : 1);
        break;

    case ID_HOLSTER2D:
        trap_Cvar_SetValue("cg_weaponSelectorSimple2DIcons", s_preferences.holster2d.curvalue);
        break;

    case ID_GORE: {
        switch ((int)s_preferences.gore.curvalue) {
        case 0:
            trap_Cvar_SetValue("com_blood", 0);
            trap_Cvar_SetValue("cg_gibs", 0);
            trap_Cvar_SetValue("cg_megagibs", 0);
            break;
        case 1:
            trap_Cvar_SetValue("com_blood", 1);
            trap_Cvar_SetValue("cg_gibs", 0);
            trap_Cvar_SetValue("cg_megagibs", 0);
            break;
        case 2:
            trap_Cvar_SetValue("com_blood", 1);
            trap_Cvar_SetValue("cg_gibs", 1);
            trap_Cvar_SetValue("cg_megagibs", 0);
            break;
        case 3:
            trap_Cvar_SetValue("com_blood", 1);
            trap_Cvar_SetValue("cg_gibs", 1);
            trap_Cvar_SetValue("cg_megagibs", 1);
            break;
        }
    } break;

    case ID_SHOWINHAND:
        trap_Cvar_SetValue("vr_showItemInHand", s_preferences.showinhand.curvalue);
        break;

    case ID_SELECTORWITHHUD:
        trap_Cvar_SetValue("vr_weaponSelectorWithHud", s_preferences.selectorwithhud.curvalue);
        break;

    case ID_SHOWCONSOLE:
        trap_Cvar_SetValue("vr_showConsoleMessages", s_preferences.showconsole.curvalue);
        break;

    case ID_BACK:
        UI_PopMenu();
        break;
    }
}

/*
=================
Crosshair_Draw
=================
*/
static void Crosshair_Draw(void* self)
{
    menulist_s* s;
    float* color;
    int x, y;
    int style;
    qboolean focus;

    s = (menulist_s*)self;
    x = s->generic.x;
    y = s->generic.y;

    style = UI_SMALLFONT;
    focus = (s->generic.parent->cursor == s->generic.menuPosition);

    if (s->generic.flags & QMF_GRAYED)
        color = text_color_disabled;
    else if (focus) {
        color = text_color_highlight;
        style |= UI_PULSE;
    } else if (s->generic.flags & QMF_BLINK) {
        color = text_color_highlight;
        style |= UI_BLINK;
    } else
        color = text_color_normal;

    if (focus) {
        // draw cursor
        UI_FillRect(s->generic.left, s->generic.top, s->generic.right - s->generic.left + 1, s->generic.bottom - s->generic.top + 1, listbar_color);
        UI_DrawChar(x, y, 13, UI_CENTER | UI_BLINK | UI_SMALLFONT, color);
    }

    UI_DrawString(x - SMALLCHAR_WIDTH, y, s->generic.name, style | UI_RIGHT, color);
    if (!s->curvalue) {
        return;
    }
    UI_DrawHandlePic(x + SMALLCHAR_WIDTH, y - 4, 24, 24, s_preferences.crosshairShader[s->curvalue]);
}

static void Preferences_MenuInit(void)
{
    int y;

    memset(&s_preferences, 0, sizeof(preferences_t));

    Preferences_Cache();

    s_preferences.menu.wrapAround = qtrue;
    s_preferences.menu.fullscreen = qtrue;

    s_preferences.banner.generic.type = MTYPE_BTEXT;
    s_preferences.banner.generic.x = 320;
    s_preferences.banner.generic.y = 16;
    s_preferences.banner.string = "GAME OPTIONS";
    s_preferences.banner.color = color_white;
    s_preferences.banner.style = UI_CENTER;

    s_preferences.framel.generic.type = MTYPE_BITMAP;
    s_preferences.framel.generic.name = ART_FRAMEL;
    s_preferences.framel.generic.flags = QMF_INACTIVE;
    s_preferences.framel.generic.x = 0;
    s_preferences.framel.generic.y = 78;
    s_preferences.framel.width = 256;
    s_preferences.framel.height = 329;

    s_preferences.framer.generic.type = MTYPE_BITMAP;
    s_preferences.framer.generic.name = ART_FRAMER;
    s_preferences.framer.generic.flags = QMF_INACTIVE;
    s_preferences.framer.generic.x = 376;
    s_preferences.framer.generic.y = 76;
    s_preferences.framer.width = 256;
    s_preferences.framer.height = 334;

    y = 100;
    s_preferences.crosshair.generic.type = MTYPE_SPINCONTROL;
    s_preferences.crosshair.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT | QMF_NODEFAULTINIT | QMF_OWNERDRAW;
    s_preferences.crosshair.generic.x = PREFERENCES_X_POS;
    s_preferences.crosshair.generic.y = y;
    s_preferences.crosshair.generic.name = "Crosshair:";
    s_preferences.crosshair.generic.callback = Preferences_Event;
    s_preferences.crosshair.generic.ownerdraw = Crosshair_Draw;
    s_preferences.crosshair.generic.id = ID_CROSSHAIR;
    s_preferences.crosshair.generic.top = y - 4;
    s_preferences.crosshair.generic.bottom = y + 20;
    s_preferences.crosshair.generic.left = PREFERENCES_X_POS - ((strlen(s_preferences.crosshair.generic.name) + 1) * SMALLCHAR_WIDTH);
    s_preferences.crosshair.generic.right = PREFERENCES_X_POS + 48;
    s_preferences.crosshair.numitems = NUM_CROSSHAIRS;

    y += BIGCHAR_HEIGHT + 2 + 4;
    s_preferences.lasersight.generic.type = MTYPE_RADIOBUTTON;
    s_preferences.lasersight.generic.name = "Laser Sight:";
    s_preferences.lasersight.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.lasersight.generic.callback = Preferences_Event;
    s_preferences.lasersight.generic.id = ID_LASERSIGHT;
    s_preferences.lasersight.generic.x = PREFERENCES_X_POS;
    s_preferences.lasersight.generic.y = y;

    y += BIGCHAR_HEIGHT + 2;
    s_preferences.simpleitems.generic.type = MTYPE_RADIOBUTTON;
    s_preferences.simpleitems.generic.name = "Simple Items (World):";
    s_preferences.simpleitems.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.simpleitems.generic.callback = Preferences_Event;
    s_preferences.simpleitems.generic.id = ID_SIMPLEITEMS;
    s_preferences.simpleitems.generic.x = PREFERENCES_X_POS;
    s_preferences.simpleitems.generic.y = y;

    y += BIGCHAR_HEIGHT + 2;
    s_preferences.holster2d.generic.type = MTYPE_RADIOBUTTON;
    s_preferences.holster2d.generic.name = "Simple Items (Weapon Wheel):";
    s_preferences.holster2d.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.holster2d.generic.callback = Preferences_Event;
    s_preferences.holster2d.generic.id = ID_HOLSTER2D;
    s_preferences.holster2d.generic.x = PREFERENCES_X_POS;
    s_preferences.holster2d.generic.y = y;

    y += BIGCHAR_HEIGHT + 2;
    s_preferences.showinhand.generic.type = MTYPE_RADIOBUTTON;
    s_preferences.showinhand.generic.name = "Show Item In Hand:";
    s_preferences.showinhand.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.showinhand.generic.callback = Preferences_Event;
    s_preferences.showinhand.generic.id = ID_SHOWINHAND;
    s_preferences.showinhand.generic.x = PREFERENCES_X_POS;
    s_preferences.showinhand.generic.y = y;

    y += BIGCHAR_HEIGHT + 2;
    s_preferences.wallmarks.generic.type = MTYPE_RADIOBUTTON;
    s_preferences.wallmarks.generic.name = "Marks on Walls:";
    s_preferences.wallmarks.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.wallmarks.generic.callback = Preferences_Event;
    s_preferences.wallmarks.generic.id = ID_WALLMARKS;
    s_preferences.wallmarks.generic.x = PREFERENCES_X_POS;
    s_preferences.wallmarks.generic.y = y;

    y += BIGCHAR_HEIGHT + 2;
    s_preferences.brass.generic.type = MTYPE_RADIOBUTTON;
    s_preferences.brass.generic.name = "Ejecting Brass:";
    s_preferences.brass.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.brass.generic.callback = Preferences_Event;
    s_preferences.brass.generic.id = ID_EJECTINGBRASS;
    s_preferences.brass.generic.x = PREFERENCES_X_POS;
    s_preferences.brass.generic.y = y;

    y += BIGCHAR_HEIGHT + 2;
    s_preferences.identifytarget.generic.type = MTYPE_RADIOBUTTON;
    s_preferences.identifytarget.generic.name = "Identify Target:";
    s_preferences.identifytarget.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.identifytarget.generic.callback = Preferences_Event;
    s_preferences.identifytarget.generic.id = ID_IDENTIFYTARGET;
    s_preferences.identifytarget.generic.x = PREFERENCES_X_POS;
    s_preferences.identifytarget.generic.y = y;

    y += BIGCHAR_HEIGHT + 2;
    s_preferences.forcemodel.generic.type = MTYPE_RADIOBUTTON;
    s_preferences.forcemodel.generic.name = "Force Player Models:";
    s_preferences.forcemodel.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.forcemodel.generic.callback = Preferences_Event;
    s_preferences.forcemodel.generic.id = ID_FORCEMODEL;
    s_preferences.forcemodel.generic.x = PREFERENCES_X_POS;
    s_preferences.forcemodel.generic.y = y;

    y += BIGCHAR_HEIGHT + 2;
    s_preferences.drawteamoverlay.generic.type = MTYPE_SPINCONTROL;
    s_preferences.drawteamoverlay.generic.name = "Draw Team Overlay:";
    s_preferences.drawteamoverlay.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.drawteamoverlay.generic.callback = Preferences_Event;
    s_preferences.drawteamoverlay.generic.id = ID_DRAWTEAMOVERLAY;
    s_preferences.drawteamoverlay.generic.x = PREFERENCES_X_POS;
    s_preferences.drawteamoverlay.generic.y = y;
    s_preferences.drawteamoverlay.itemnames = teamoverlay_names;

    y += BIGCHAR_HEIGHT + 2;
    s_preferences.drawhud.generic.type = MTYPE_SPINCONTROL;
    s_preferences.drawhud.generic.name = "HUD Mode:";
    s_preferences.drawhud.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.drawhud.generic.callback = Preferences_Event;
    s_preferences.drawhud.generic.id = ID_DRAWHUD;
    s_preferences.drawhud.generic.x = PREFERENCES_X_POS;
    s_preferences.drawhud.generic.y = y;
    s_preferences.drawhud.itemnames = hud_names;

    y += BIGCHAR_HEIGHT + 2;
    s_preferences.selectorwithhud.generic.type = MTYPE_RADIOBUTTON;
    s_preferences.selectorwithhud.generic.name = "Draw HUD On Weapon Wheel:";
    s_preferences.selectorwithhud.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.selectorwithhud.generic.callback = Preferences_Event;
    s_preferences.selectorwithhud.generic.id = ID_SELECTORWITHHUD;
    s_preferences.selectorwithhud.generic.x = PREFERENCES_X_POS;
    s_preferences.selectorwithhud.generic.y = y;

    y += BIGCHAR_HEIGHT + 2;
    s_preferences.showconsole.generic.type = MTYPE_RADIOBUTTON;
    s_preferences.showconsole.generic.name = "Show Console Messages:";
    s_preferences.showconsole.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.showconsole.generic.callback = Preferences_Event;
    s_preferences.showconsole.generic.id = ID_SHOWCONSOLE;
    s_preferences.showconsole.generic.x = PREFERENCES_X_POS;
    s_preferences.showconsole.generic.y = y;

    y += BIGCHAR_HEIGHT + 16;
    s_preferences.gore.generic.type = MTYPE_SPINCONTROL;
    s_preferences.gore.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
    s_preferences.gore.generic.x = PREFERENCES_X_POS - 120;
    s_preferences.gore.generic.y = y;
    s_preferences.gore.generic.name = "Gore:";
    s_preferences.gore.generic.callback = Preferences_Event;
    s_preferences.gore.generic.id = ID_GORE;
    s_preferences.gore.itemnames = s_gore;
    s_preferences.gore.numitems = NUM_GORE;

    s_preferences.back.generic.type = MTYPE_BITMAP;
    s_preferences.back.generic.name = ART_BACK0;
    s_preferences.back.generic.flags = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
    s_preferences.back.generic.callback = Preferences_Event;
    s_preferences.back.generic.id = ID_BACK;
    s_preferences.back.generic.x = 0;
    s_preferences.back.generic.y = 480 - 64;
    s_preferences.back.width = 128;
    s_preferences.back.height = 64;
    s_preferences.back.focuspic = ART_BACK1;

    Menu_AddItem(&s_preferences.menu, &s_preferences.banner);
    Menu_AddItem(&s_preferences.menu, &s_preferences.framel);
    Menu_AddItem(&s_preferences.menu, &s_preferences.framer);

    Menu_AddItem(&s_preferences.menu, &s_preferences.crosshair);
    Menu_AddItem(&s_preferences.menu, &s_preferences.lasersight);
    Menu_AddItem(&s_preferences.menu, &s_preferences.simpleitems);
    Menu_AddItem(&s_preferences.menu, &s_preferences.wallmarks);
    Menu_AddItem(&s_preferences.menu, &s_preferences.brass);
    Menu_AddItem(&s_preferences.menu, &s_preferences.identifytarget);
    Menu_AddItem(&s_preferences.menu, &s_preferences.forcemodel);
    Menu_AddItem(&s_preferences.menu, &s_preferences.drawteamoverlay);
    Menu_AddItem(&s_preferences.menu, &s_preferences.drawhud);
    Menu_AddItem(&s_preferences.menu, &s_preferences.holster2d);
    Menu_AddItem(&s_preferences.menu, &s_preferences.gore);
    Menu_AddItem(&s_preferences.menu, &s_preferences.showinhand);
    Menu_AddItem(&s_preferences.menu, &s_preferences.selectorwithhud);
    Menu_AddItem(&s_preferences.menu, &s_preferences.showconsole);

    Menu_AddItem(&s_preferences.menu, &s_preferences.back);

    Preferences_SetMenuItems();
}

/*
===============
Preferences_Cache
===============
*/
void Preferences_Cache(void)
{
    int n;

    trap_R_RegisterShaderNoMip(ART_FRAMEL);
    trap_R_RegisterShaderNoMip(ART_FRAMER);
    trap_R_RegisterShaderNoMip(ART_BACK0);
    trap_R_RegisterShaderNoMip(ART_BACK1);
    for (n = 0; n < NUM_CROSSHAIRS; n++) {
        s_preferences.crosshairShader[n] = trap_R_RegisterShaderNoMip(va("gfx/2d/crosshair%c", 'a' + n));
    }
}

/*
===============
UI_PreferencesMenu
===============
*/
void UI_PreferencesMenu(void)
{
    Preferences_MenuInit();
    UI_PushMenu(&s_preferences.menu);
}
