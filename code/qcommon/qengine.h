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
// qengine.h -- definitions that are used in non-vm modules
#ifndef QENGINE_H
#define QENGINE_H

#ifndef Q3_ENGINE
#error "Header file should not be included in non-engine components"
#endif

#include "cvar_engine.h"

extern cvar_t* com_developer;
extern cvar_t* com_speeds;
extern cvar_t* com_timescale;
extern cvar_t* com_sv_running;
extern cvar_t* com_cl_running;
extern cvar_t* com_version;
extern cvar_t* com_buildScript; // for building release pak files
extern cvar_t* com_journal;
extern cvar_t* com_cameraMode;

// both client and server must agree to pause
extern cvar_t* cl_paused;
extern cvar_t* sv_paused;

#endif // QCOMMON_H
