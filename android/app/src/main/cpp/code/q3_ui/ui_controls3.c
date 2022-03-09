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

CONTROLS OPTIONS MENU

=======================================================================
*/


#include "ui_local.h"


#define ART_FRAMEL				"menu/art/frame2_l"
#define ART_FRAMER				"menu/art/frame1_r"
#define ART_BACK0				"menu/art/back_0"
#define ART_BACK1				"menu/art/back_1"

#define VR_X_POS		360

#define ID_AUTOSWITCH			127
#define ID_SCOPE				128
#define ID_TWOHANDED			129
#define ID_DIRECTIONMODE		130
#define ID_RIGHTHANDED			131
#define ID_WEAPONPITCH			132
#define ID_ALTKEY				133

#define ID_BACK					134

#define	NUM_DIRECTIONMODE		2


typedef struct {
	menuframework_s		menu;

	menutext_s			banner;
	menubitmap_s		framel;
	menubitmap_s		framer;

	menuradiobutton_s	autoswitch;
	menuradiobutton_s	scope;
	menuradiobutton_s	twohanded;
	menulist_s          directionmode;
	menuradiobutton_s	righthanded;
	menuslider_s 		weaponpitch;
	menuradiobutton_s	altkey;

	menubitmap_s		back;
} controls3_t;

static controls3_t s_controls3;


static void Controls3_SetMenuItems( void ) {
	s_controls3.autoswitch.curvalue			= trap_Cvar_VariableValue( "cg_autoswitch" ) != 0;
    s_controls3.scope.curvalue				= trap_Cvar_VariableValue( "vr_weaponScope" ) != 0;
    s_controls3.twohanded.curvalue		    = trap_Cvar_VariableValue( "vr_twoHandedWeapons" ) != 0;
	s_controls3.directionmode.curvalue		= (int)trap_Cvar_VariableValue( "vr_directionMode" )  % NUM_DIRECTIONMODE;
	s_controls3.righthanded.curvalue		= trap_Cvar_VariableValue( "vr_righthanded" ) != 0;
    s_controls3.weaponpitch.curvalue		= trap_Cvar_VariableValue( "vr_weaponPitch" )  + 25;
    s_controls3.altkey.curvalue			    = trap_Cvar_VariableValue( "vr_altKeyEnabled" ) != 0;
}


static void Controls3_MenuEvent( void* ptr, int notification ) {
	if( notification != QM_ACTIVATED ) {
		return;
	}

	switch( ((menucommon_s*)ptr)->id ) {
	case ID_AUTOSWITCH:
		trap_Cvar_SetValue( "cg_autoswitch", s_controls3.autoswitch.curvalue );
		break;

    case ID_SCOPE:
        trap_Cvar_SetValue( "vr_weaponScope", s_controls3.scope.curvalue );
        break;

    case ID_TWOHANDED:
        trap_Cvar_SetValue( "vr_twoHandedWeapons", s_controls3.twohanded.curvalue );
        break;

	case ID_DIRECTIONMODE:
		trap_Cvar_SetValue( "vr_directionMode", s_controls3.directionmode.curvalue );
		break;

	case ID_RIGHTHANDED:
		trap_Cvar_SetValue( "vr_righthanded", s_controls3.righthanded.curvalue );
		break;

    case ID_WEAPONPITCH:
        trap_Cvar_SetValue( "vr_weaponPitch", s_controls3.weaponpitch.curvalue - 25 );
        break;

    case ID_ALTKEY:
        trap_Cvar_SetValue( "vr_altKeyEnabled", s_controls3.altkey.curvalue );
        break;

	case ID_BACK:
		UI_PopMenu();
		break;
	}
}

static void Controls3_MenuInit( void ) {
	int				y;

	static const char *s_directionmode[] =
			{
					"HMD (Default)",
					"Off-hand Controller",
					NULL
			};

	memset( &s_controls3, 0 ,sizeof(controls3_t) );

	Controls3_Cache();

	s_controls3.menu.wrapAround = qtrue;
	s_controls3.menu.fullscreen = qtrue;

	s_controls3.banner.generic.type  = MTYPE_BTEXT;
	s_controls3.banner.generic.x	   = 320;
	s_controls3.banner.generic.y	   = 16;
	s_controls3.banner.string		   = "CONTROLS";
	s_controls3.banner.color         = color_white;
	s_controls3.banner.style         = UI_CENTER;

	s_controls3.framel.generic.type  = MTYPE_BITMAP;
	s_controls3.framel.generic.name  = ART_FRAMEL;
	s_controls3.framel.generic.flags = QMF_INACTIVE;
	s_controls3.framel.generic.x	   = 0;
	s_controls3.framel.generic.y	   = 78;
	s_controls3.framel.width  	   = 256;
	s_controls3.framel.height  	   = 329;

	s_controls3.framer.generic.type  = MTYPE_BITMAP;
	s_controls3.framer.generic.name  = ART_FRAMER;
	s_controls3.framer.generic.flags = QMF_INACTIVE;
	s_controls3.framer.generic.x	   = 376;
	s_controls3.framer.generic.y	   = 76;
	s_controls3.framer.width  	   = 256;
	s_controls3.framer.height  	   = 334;

	y = 180;
	s_controls3.autoswitch.generic.type      = MTYPE_RADIOBUTTON;
	s_controls3.autoswitch.generic.flags	    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_controls3.autoswitch.generic.name	    = "Autoswitch Weapons:";
	s_controls3.autoswitch.generic.id        = ID_AUTOSWITCH;
	s_controls3.autoswitch.generic.callback  = Controls3_MenuEvent;
	s_controls3.autoswitch.generic.x	          = VR_X_POS;
	s_controls3.autoswitch.generic.y	          = y;

    y += BIGCHAR_HEIGHT+2;
    s_controls3.scope.generic.type        = MTYPE_RADIOBUTTON;
    s_controls3.scope.generic.name	      = "Railgun Scope:";
    s_controls3.scope.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
    s_controls3.scope.generic.callback    = Controls3_MenuEvent;
    s_controls3.scope.generic.id          = ID_SCOPE;
    s_controls3.scope.generic.x	          = VR_X_POS;
    s_controls3.scope.generic.y	          = y;

    y += BIGCHAR_HEIGHT+2;
    s_controls3.twohanded.generic.type        = MTYPE_RADIOBUTTON;
    s_controls3.twohanded.generic.name	      = "Two-Handed Weapons:";
    s_controls3.twohanded.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
    s_controls3.twohanded.generic.callback    = Controls3_MenuEvent;
    s_controls3.twohanded.generic.id          = ID_TWOHANDED;
    s_controls3.twohanded.generic.x	          = VR_X_POS;
    s_controls3.twohanded.generic.y	          = y;

	y += BIGCHAR_HEIGHT+2;
	s_controls3.directionmode.generic.type			= MTYPE_SPINCONTROL;
	s_controls3.directionmode.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_controls3.directionmode.generic.x				= VR_X_POS;
	s_controls3.directionmode.generic.y				= y;
	s_controls3.directionmode.generic.name			= "Direction Mode:";
	s_controls3.directionmode.generic.callback		= Controls3_MenuEvent;
	s_controls3.directionmode.generic.id			= ID_DIRECTIONMODE;
	s_controls3.directionmode.itemnames	        	= s_directionmode;
	s_controls3.directionmode.numitems				= NUM_DIRECTIONMODE;

	y += BIGCHAR_HEIGHT+2;
	s_controls3.righthanded.generic.type        = MTYPE_RADIOBUTTON;
	s_controls3.righthanded.generic.name	      = "Right-Handed:";
	s_controls3.righthanded.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_controls3.righthanded.generic.callback    = Controls3_MenuEvent;
	s_controls3.righthanded.generic.id          = ID_RIGHTHANDED;
	s_controls3.righthanded.generic.x	          = VR_X_POS;
	s_controls3.righthanded.generic.y	          = y;

    y += BIGCHAR_HEIGHT+2;
	s_controls3.weaponpitch.generic.type	     = MTYPE_SLIDER;
	s_controls3.weaponpitch.generic.x			 = VR_X_POS;
    s_controls3.weaponpitch.generic.y			 = y;
	s_controls3.weaponpitch.generic.flags	 	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_controls3.weaponpitch.generic.name	     = "Weapon Pitch:";
	s_controls3.weaponpitch.generic.id 	     = ID_WEAPONPITCH;
	s_controls3.weaponpitch.generic.callback  	= Controls3_MenuEvent;
	s_controls3.weaponpitch.minvalue		     = 0;
	s_controls3.weaponpitch.maxvalue		     = 30;

    y += BIGCHAR_HEIGHT+2;
	s_controls3.altkey.generic.type	    	 = MTYPE_RADIOBUTTON;
	s_controls3.altkey.generic.x			 = VR_X_POS;
    s_controls3.altkey.generic.y			 = y;
	s_controls3.altkey.generic.flags	 	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
	s_controls3.altkey.generic.name	    	 = "ALT Layout Trigger:";
	s_controls3.altkey.generic.id 	     	= ID_ALTKEY;
	s_controls3.altkey.generic.callback  	= Controls3_MenuEvent;

	s_controls3.back.generic.type	    = MTYPE_BITMAP;
	s_controls3.back.generic.name     = ART_BACK0;
	s_controls3.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
	s_controls3.back.generic.callback = Controls3_MenuEvent;
	s_controls3.back.generic.id	    = ID_BACK;
	s_controls3.back.generic.x		= 0;
	s_controls3.back.generic.y		= 480-64;
	s_controls3.back.width  		    = 128;
	s_controls3.back.height  		    = 64;
	s_controls3.back.focuspic         = ART_BACK1;

	Menu_AddItem( &s_controls3.menu, &s_controls3.banner );
	Menu_AddItem( &s_controls3.menu, &s_controls3.framel );
	Menu_AddItem( &s_controls3.menu, &s_controls3.framer );

	Menu_AddItem( &s_controls3.menu, &s_controls3.autoswitch );
	Menu_AddItem( &s_controls3.menu, &s_controls3.scope );
	Menu_AddItem( &s_controls3.menu, &s_controls3.twohanded );
	Menu_AddItem( &s_controls3.menu, &s_controls3.directionmode );
	Menu_AddItem( &s_controls3.menu, &s_controls3.righthanded );
	Menu_AddItem( &s_controls3.menu, &s_controls3.weaponpitch );
	Menu_AddItem( &s_controls3.menu, &s_controls3.altkey );

	Menu_AddItem( &s_controls3.menu, &s_controls3.back );

	Controls3_SetMenuItems();
}


/*
===============
Controls3_Cache
===============
*/
void Controls3_Cache( void ) {
	trap_R_RegisterShaderNoMip( ART_FRAMEL );
	trap_R_RegisterShaderNoMip( ART_FRAMER );
	trap_R_RegisterShaderNoMip( ART_BACK0 );
	trap_R_RegisterShaderNoMip( ART_BACK1 );
}


/*
===============
UI_Controls3Menu
===============
*/
void UI_Controls3Menu( void ) {
	Controls3_MenuInit();
	UI_PushMenu( &s_controls3.menu );
}
