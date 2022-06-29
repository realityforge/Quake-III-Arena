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
#ifndef CVAR_H
#define CVAR_H

/*
==========================================================

CVARS (console variables)

cvar variables are used to hold scalar or string variables that can be changed
or displayed at the console or prog code as well as accessed directly
in C code.

The user can access cvars from the console in three ways:
r_draworder			prints the current value
r_draworder 0		sets the current value to 0
set r_draworder 0	as above, but creates the cvar if not present

Cvars are restricted from having the same names as commands to keep this
interface from being ambiguous.

They are also occasionally used to communicated information between different
modules of the program.

Many variables can be used for cheating purposes, so when
cheats is zero, force all unspecified variables to their
default values.

*/

#define CVAR_ARCHIVE 1 // set to cause it to be saved to vars.rc
                       // used for system variables, not for player
                       // specific configurations
#define CVAR_USERINFO 2 // sent to server on connect or change
#define CVAR_SERVERINFO 4 // sent in response to front end requests
#define CVAR_SYSTEMINFO 8 // these cvars will be duplicated on all clients
#define CVAR_INIT 16 // don't allow change from console at all,
                     // but can be set from the command line
#define CVAR_LATCH 32 // will only change when C code next does
                      // a Cvar_Get(), so it can't be changed
                      // without proper initialization.  modified
                      // will be set, even though the value hasn't
                      // changed yet
#define CVAR_ROM 64 // display only, cannot be set by user at all
#define CVAR_USER_CREATED 128 // created by a set command
#define CVAR_TEMP 256 // can be set even when cheats are disabled, but is not archived
#define CVAR_CHEAT 512 // can not be changed if cheats are disabled
#define CVAR_NORESTART 1024 // do not clear when a cvar_restart is issued

#define MAX_CVAR_VALUE_STRING 256

typedef int cvarHandle_t;

// the modules that run in the virtual machine can't access the cvar_t directly,
// so they must ask for structured updates
typedef struct vmCvar_s {
    cvarHandle_t handle;
    int modificationCount;
    float value;
    int integer;
    char string[MAX_CVAR_VALUE_STRING];
} vmCvar_t;

#endif
