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
/*
=======================================================================

RESET MENU

=======================================================================
*/

#include "ui_local.h"


#define ART_FRAME					"menu/art/cut_frame"

#define ID_NO		100
#define ID_YES		101

typedef struct
{
	menuframework_s menu;
	menutext_s		no;
	menutext_s		yes;
	int				slashX;
} resetMenu_t;

static resetMenu_t	s_reset;


void Reset_MenuEvent(void* ptr, int event) {
	if( event != QM_ACTIVATED ) {
		return;
	}

	UI_PopMenu();

	if( ((menucommon_s*)ptr)->id == ID_NO ) {
		return;
	}

	// reset the game, pop the level menu and restart it so it updates
	UI_NewGame();
	trap_Cvar_SetValue( "ui_spSelection", 0 );
	UI_PopMenu();
	UI_SPLevelMenu();
}
