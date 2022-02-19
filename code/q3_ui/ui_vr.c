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

VR OPTIONS MENU

=======================================================================
*/


#include "ui_local.h"


#define ART_FRAMEL				"menu/art/frame2_l"
#define ART_FRAMER				"menu/art/frame1_r"
#define ART_BACK0				"menu/art/back_0"
#define ART_BACK1				"menu/art/back_1"

#define VR_X_POS		360

#define ID_HUDDEPTH			    127
#define ID_RIGHTHANDED			128
#define ID_SNAPTURN				129
#define ID_DIRECTIONMODE		130
#define ID_JUMPTRIGGER			131
#define ID_REFRESHRATE			132
#define ID_WEAPONPITCH			133
#define ID_HEIGHTADJUST			134
#define ID_TWOHANDED			135
#define ID_SCOPE				136
#define ID_DRAWHUD			    137
#define ID_ROLLHIT			    138
#define ID_GORE 			    139

#define ID_BACK					140

#define	NUM_HUDDEPTH			6
#define	NUM_DIRECTIONMODE		2
#define	NUM_REFRESHRATE			5
#define	NUM_GORE    			4


typedef struct {
	menuframework_s		menu;

	menutext_s			banner;
	menubitmap_s		framel;
	menubitmap_s		framer;

    menuradiobutton_s	drawhud;
	menulist_s          huddepth;
	menuradiobutton_s	righthanded;
	menulist_s          snapturn;
	menulist_s          directionmode;
	menuradiobutton_s	jumptrigger;
	menulist_s          refreshrate;
	menuslider_s 		weaponpitch;
    menuslider_s 		heightadjust;
    menuradiobutton_s	twohanded;
    menuradiobutton_s	scope;
    menuradiobutton_s	rollhit;
	menulist_s 			gore;

	menubitmap_s		back;
} VR_t;

static VR_t s_VR;


static void VR_SetMenuItems( void ) {
    s_VR.drawhud.curvalue		= trap_Cvar_VariableValue( "cg_drawStatus" ) != 0;
	s_VR.huddepth.curvalue		= (int)trap_Cvar_VariableValue( "vr_hudDepth" ) % NUM_HUDDEPTH;
	s_VR.righthanded.curvalue		= trap_Cvar_VariableValue( "vr_righthanded" ) != 0;
	s_VR.snapturn.curvalue		= (int)trap_Cvar_VariableValue( "vr_snapturn" ) / 45;
	s_VR.directionmode.curvalue		= (int)trap_Cvar_VariableValue( "vr_directionMode" )  % NUM_DIRECTIONMODE;
	s_VR.jumptrigger.curvalue		= trap_Cvar_VariableValue( "vr_jumpTrigger" )  != 0;
	int refresh		= (int)trap_Cvar_VariableValue( "vr_refreshrate" );
	switch (refresh)
	{
		case 60:
			s_VR.refreshrate.curvalue = 0;
			break;
		case 72:
			s_VR.refreshrate.curvalue = 1;
			break;
		case 80:
			s_VR.refreshrate.curvalue = 2;
			break;
		case 90:
			s_VR.refreshrate.curvalue = 3;
			break;
		case 120:
			s_VR.refreshrate.curvalue = 4;
			break;
	}
    s_VR.weaponpitch.curvalue		= trap_Cvar_VariableValue( "vr_weaponPitch" )  + 25;
    s_VR.heightadjust.curvalue		= trap_Cvar_VariableValue( "vr_heightAdjust" )  != 0;
    s_VR.twohanded.curvalue		    = trap_Cvar_VariableValue( "vr_twoHandedWeapons" ) != 0;
    s_VR.scope.curvalue		    = trap_Cvar_VariableValue( "vr_weaponScope" ) != 0;
    s_VR.rollhit.curvalue		    = trap_Cvar_VariableValue( "vr_rollWhenHit" ) != 0;

    //GORE
    {
        int level = trap_Cvar_VariableValue( "com_blood" ) +
					trap_Cvar_VariableValue( "cg_gibs" ) +
					trap_Cvar_VariableValue( "cg_megagibs" );

		s_VR.gore.curvalue		    = level % NUM_GORE;
    }
}


static void VR_Event( void* ptr, int notification ) {
	if( notification != QM_ACTIVATED ) {
		return;
	}

	switch( ((menucommon_s*)ptr)->id ) {
	case ID_HUDDEPTH:
		trap_Cvar_SetValue( "vr_hudDepth", s_VR.huddepth.curvalue );
		break;

	case ID_RIGHTHANDED:
		trap_Cvar_SetValue( "vr_righthanded", s_VR.righthanded.curvalue );
		break;

	case ID_SNAPTURN:
		trap_Cvar_SetValue( "vr_snapturn", s_VR.snapturn.curvalue * 45 );
		break;

	case ID_DIRECTIONMODE:
		trap_Cvar_SetValue( "vr_directionMode", s_VR.directionmode.curvalue );
		break;

	case ID_JUMPTRIGGER:
		trap_Cvar_SetValue( "vr_jumpTrigger", s_VR.jumptrigger.curvalue );
		break;

	case ID_REFRESHRATE: {
			int refresh;
			switch (s_VR.refreshrate.curvalue) {
				case 0:
					refresh = 60;
					break;
				case 1:
					refresh = 72;
					break;
				case 2:
					refresh = 80;
					break;
				case 3:
					refresh = 90;
					break;
				case 4:
					refresh = 120;
					break;
			}
			trap_Cvar_SetValue("vr_refreshrate", refresh);
		}
		break;

    case ID_WEAPONPITCH:
        trap_Cvar_SetValue( "vr_weaponPitch", s_VR.weaponpitch.curvalue - 25 );
        break;

    case ID_HEIGHTADJUST:
        trap_Cvar_SetValue( "vr_heightAdjust", s_VR.heightadjust.curvalue );
        break;

    case ID_TWOHANDED:
        trap_Cvar_SetValue( "vr_twoHandedWeapons", s_VR.twohanded.curvalue );
        break;

    case ID_SCOPE:
        trap_Cvar_SetValue( "vr_weaponScope", s_VR.scope.curvalue );
        break;

    case ID_DRAWHUD:
        trap_Cvar_SetValue( "cg_drawStatus", s_VR.drawhud.curvalue );
        break;

    case ID_ROLLHIT:
        trap_Cvar_SetValue( "vr_rollWhenHit", s_VR.rollhit.curvalue );
        break;

	case ID_GORE: {
			switch ((int)s_VR.gore.curvalue) {
				case 0:
					trap_Cvar_SetValue( "com_blood", 0);
					trap_Cvar_SetValue( "cg_gibs", 0);
					trap_Cvar_SetValue( "cg_megagibs", 0);
					break;
				case 1:
					trap_Cvar_SetValue( "com_blood", 1);
					trap_Cvar_SetValue( "cg_gibs", 0);
					trap_Cvar_SetValue( "cg_megagibs", 0);
					break;
				case 2:
					trap_Cvar_SetValue( "com_blood", 1);
					trap_Cvar_SetValue( "cg_gibs", 1);
					trap_Cvar_SetValue( "cg_megagibs", 0);
					break;
				case 3:
					trap_Cvar_SetValue( "com_blood", 1);
					trap_Cvar_SetValue( "cg_gibs", 1);
					trap_Cvar_SetValue( "cg_megagibs", 1);
					break;

			}
		}
		break;

	case ID_BACK:
		UI_PopMenu();
		break;
	}
}



/*
=================
Controls_StatusBar
=================
*/
static void VR_StatusBar( void *self )
{
	UI_DrawString(SCREEN_WIDTH * 0.50, SCREEN_HEIGHT * 0.80, "Use Arrow Keys or CLICK to change", UI_SMALLFONT|UI_CENTER, colorWhite );
}

static void VR_MenuInit( void ) {
	int				y;

    static const char *s_hud_depths[] =
    {
            "Very Close",
            "Close",
            "Middle",
            "Further",
            "Far",
            "Distant",
            NULL
    };

	static const char *s_snapturn[] =
			{
					"Smooth Turning",
					"45 Degrees",
					"90 Degrees",
					NULL
			};

	static const char *s_directionmode[] =
			{
					"HMD",
					"Off-hand Controller",
					NULL
			};

	static const char *s_refreshrate[] =
			{
					"60",
					"72",
					"80",
					"90",
					"120",
					NULL
			};

	static const char *s_gore[] =
			{
					"None",
					"Blood Only",
					"Blood & Gibs",
					"Extra Gore (Performance Hit)",
					NULL
			};

	memset( &s_VR, 0 ,sizeof(VR_t) );

	VR_Cache();

	s_VR.menu.wrapAround = qtrue;
	s_VR.menu.fullscreen = qtrue;

	s_VR.banner.generic.type  = MTYPE_BTEXT;
	s_VR.banner.generic.x	   = 320;
	s_VR.banner.generic.y	   = 16;
	s_VR.banner.string		   = "GAME OPTIONS";
	s_VR.banner.color         = color_white;
	s_VR.banner.style         = UI_CENTER;

	s_VR.framel.generic.type  = MTYPE_BITMAP;
	s_VR.framel.generic.name  = ART_FRAMEL;
	s_VR.framel.generic.flags = QMF_INACTIVE;
	s_VR.framel.generic.x	   = 0;
	s_VR.framel.generic.y	   = 78;
	s_VR.framel.width  	   = 256;
	s_VR.framel.height  	   = 329;

	s_VR.framer.generic.type  = MTYPE_BITMAP;
	s_VR.framer.generic.name  = ART_FRAMER;
	s_VR.framer.generic.flags = QMF_INACTIVE;
	s_VR.framer.generic.x	   = 376;
	s_VR.framer.generic.y	   = 76;
	s_VR.framer.width  	   = 256;
	s_VR.framer.height  	   = 334;

	y = 144;
    s_VR.drawhud.generic.type        = MTYPE_RADIOBUTTON;
    s_VR.drawhud.generic.name	      = "Draw HUD:";
    s_VR.drawhud.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
    s_VR.drawhud.generic.callback    = VR_Event;
    s_VR.drawhud.generic.id          = ID_DRAWHUD;
    s_VR.drawhud.generic.x	          = VR_X_POS;
    s_VR.drawhud.generic.y	          = y;

    y += BIGCHAR_HEIGHT;
    s_VR.huddepth.generic.type		= MTYPE_SPINCONTROL;
    s_VR.huddepth.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
    s_VR.huddepth.generic.x			= VR_X_POS;
    s_VR.huddepth.generic.y			= y;
    s_VR.huddepth.generic.name		= "HUD Depth:";
    s_VR.huddepth.generic.callback	= VR_Event;
    s_VR.huddepth.generic.id		= ID_HUDDEPTH;
    s_VR.huddepth.itemnames	        = s_hud_depths;
    s_VR.huddepth.numitems			= NUM_HUDDEPTH;

	y += BIGCHAR_HEIGHT;
	s_VR.righthanded.generic.type        = MTYPE_RADIOBUTTON;
	s_VR.righthanded.generic.name	      = "Right-Handed:";
	s_VR.righthanded.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_VR.righthanded.generic.callback    = VR_Event;
	s_VR.righthanded.generic.id          = ID_RIGHTHANDED;
	s_VR.righthanded.generic.x	          = VR_X_POS;
	s_VR.righthanded.generic.y	          = y;

	y += BIGCHAR_HEIGHT;
	s_VR.snapturn.generic.type			= MTYPE_SPINCONTROL;
	s_VR.snapturn.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_VR.snapturn.generic.x				= VR_X_POS;
	s_VR.snapturn.generic.y				= y;
	s_VR.snapturn.generic.name			= "Turning Mode:";
	s_VR.snapturn.generic.callback		= VR_Event;
	s_VR.snapturn.generic.id			= ID_SNAPTURN;
	s_VR.snapturn.itemnames	        	= s_snapturn;
	s_VR.snapturn.numitems				= 3;

	y += BIGCHAR_HEIGHT;
	s_VR.directionmode.generic.type			= MTYPE_SPINCONTROL;
	s_VR.directionmode.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_VR.directionmode.generic.x				= VR_X_POS;
	s_VR.directionmode.generic.y				= y;
	s_VR.directionmode.generic.name			= "Direction Mode:";
	s_VR.directionmode.generic.callback		= VR_Event;
	s_VR.directionmode.generic.id			= ID_DIRECTIONMODE;
	s_VR.directionmode.itemnames	        	= s_directionmode;
	s_VR.directionmode.numitems				= NUM_DIRECTIONMODE;

	y += BIGCHAR_HEIGHT;
	s_VR.jumptrigger.generic.type        = MTYPE_RADIOBUTTON;
	s_VR.jumptrigger.generic.name	     = "Off-hand Trigger Jump:";
	s_VR.jumptrigger.generic.flags	     = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_VR.jumptrigger.generic.callback    = VR_Event;
	s_VR.jumptrigger.generic.id          = ID_JUMPTRIGGER;
	s_VR.jumptrigger.generic.x	         = VR_X_POS;
	s_VR.jumptrigger.generic.y	         = y;

	y += BIGCHAR_HEIGHT;
	s_VR.refreshrate.generic.type		= MTYPE_SPINCONTROL;
	s_VR.refreshrate.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_VR.refreshrate.generic.x			= VR_X_POS;
	s_VR.refreshrate.generic.y			= y;
	s_VR.refreshrate.generic.name		= "Refresh Rate:";
	s_VR.refreshrate.generic.callback	= VR_Event;
	s_VR.refreshrate.generic.id			= ID_REFRESHRATE;
	s_VR.refreshrate.itemnames	        = s_refreshrate;
	s_VR.refreshrate.numitems			= NUM_REFRESHRATE;

    y += BIGCHAR_HEIGHT;
	s_VR.weaponpitch.generic.type	     = MTYPE_SLIDER;
	s_VR.weaponpitch.generic.x			 = VR_X_POS;
    s_VR.weaponpitch.generic.y			 = y;
	s_VR.weaponpitch.generic.flags	 	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_VR.weaponpitch.generic.name	     = "Weapon Pitch:";
	s_VR.weaponpitch.generic.id 	     = ID_WEAPONPITCH;
	s_VR.weaponpitch.generic.callback  	= VR_Event;
	s_VR.weaponpitch.minvalue		     = -25;
	s_VR.weaponpitch.maxvalue		     = 5;
	s_VR.weaponpitch.generic.statusbar 	= VR_StatusBar;

    y += BIGCHAR_HEIGHT;
	s_VR.heightadjust.generic.type	     = MTYPE_SLIDER;
	s_VR.heightadjust.generic.x			 = VR_X_POS;
    s_VR.heightadjust.generic.y			 = y;
	s_VR.heightadjust.generic.flags	 	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_VR.heightadjust.generic.name	     = "Height Adjust:";
	s_VR.heightadjust.generic.id 	     = ID_HEIGHTADJUST;
	s_VR.heightadjust.generic.callback  	= VR_Event;
	s_VR.heightadjust.minvalue		     = 0.0f;
	s_VR.heightadjust.maxvalue		     = 1.0f;
	s_VR.heightadjust.generic.statusbar 	= VR_StatusBar;

    y += BIGCHAR_HEIGHT;
    s_VR.twohanded.generic.type        = MTYPE_RADIOBUTTON;
    s_VR.twohanded.generic.name	      = "Two-Handed Weapons:";
    s_VR.twohanded.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
    s_VR.twohanded.generic.callback    = VR_Event;
    s_VR.twohanded.generic.id          = ID_TWOHANDED;
    s_VR.twohanded.generic.x	          = VR_X_POS;
    s_VR.twohanded.generic.y	          = y;

    y += BIGCHAR_HEIGHT;
    s_VR.scope.generic.type        = MTYPE_RADIOBUTTON;
    s_VR.scope.generic.name	      = "Railgun Scope:";
    s_VR.scope.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
    s_VR.scope.generic.callback    = VR_Event;
    s_VR.scope.generic.id          = ID_SCOPE;
    s_VR.scope.generic.x	          = VR_X_POS;
    s_VR.scope.generic.y	          = y;

    y += BIGCHAR_HEIGHT;
    s_VR.rollhit.generic.type        = MTYPE_RADIOBUTTON;
    s_VR.rollhit.generic.name	      = "Roll when hit:";
    s_VR.rollhit.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
    s_VR.rollhit.generic.callback    = VR_Event;
    s_VR.rollhit.generic.id          = ID_ROLLHIT;
    s_VR.rollhit.generic.x	          = VR_X_POS;
    s_VR.rollhit.generic.y	          = y;


	y += BIGCHAR_HEIGHT + 10;
	s_VR.gore.generic.type		= MTYPE_SPINCONTROL;
	s_VR.gore.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_VR.gore.generic.x			= VR_X_POS;
	s_VR.gore.generic.y			= y;
	s_VR.gore.generic.name		= "Gore:";
	s_VR.gore.generic.callback	= VR_Event;
	s_VR.gore.generic.id		= ID_GORE;
	s_VR.gore.itemnames	        = s_gore;
	s_VR.gore.numitems			= NUM_GORE;

	s_VR.back.generic.type	    = MTYPE_BITMAP;
	s_VR.back.generic.name     = ART_BACK0;
	s_VR.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
	s_VR.back.generic.callback = VR_Event;
	s_VR.back.generic.id	    = ID_BACK;
	s_VR.back.generic.x		= 0;
	s_VR.back.generic.y		= 480-64;
	s_VR.back.width  		    = 128;
	s_VR.back.height  		    = 64;
	s_VR.back.focuspic         = ART_BACK1;

	Menu_AddItem( &s_VR.menu, &s_VR.banner );
	Menu_AddItem( &s_VR.menu, &s_VR.framel );
	Menu_AddItem( &s_VR.menu, &s_VR.framer );

	Menu_AddItem( &s_VR.menu, &s_VR.huddepth );
	Menu_AddItem( &s_VR.menu, &s_VR.righthanded );
	Menu_AddItem( &s_VR.menu, &s_VR.snapturn );
	Menu_AddItem( &s_VR.menu, &s_VR.directionmode );
	Menu_AddItem( &s_VR.menu, &s_VR.jumptrigger );
	Menu_AddItem( &s_VR.menu, &s_VR.refreshrate );
	Menu_AddItem( &s_VR.menu, &s_VR.weaponpitch );
	Menu_AddItem( &s_VR.menu, &s_VR.heightadjust );
	Menu_AddItem( &s_VR.menu, &s_VR.twohanded );
	Menu_AddItem( &s_VR.menu, &s_VR.scope );
	Menu_AddItem( &s_VR.menu, &s_VR.gore );

	Menu_AddItem( &s_VR.menu, &s_VR.back );

	VR_SetMenuItems();
}


/*
===============
VR_Cache
===============
*/
void VR_Cache( void ) {
	trap_R_RegisterShaderNoMip( ART_FRAMEL );
	trap_R_RegisterShaderNoMip( ART_FRAMER );
	trap_R_RegisterShaderNoMip( ART_BACK0 );
	trap_R_RegisterShaderNoMip( ART_BACK1 );
}


/*
===============
UI_VRMenu
===============
*/
void UI_VRMenu( void ) {
	VR_MenuInit();
	UI_PushMenu( &s_VR.menu );
}
