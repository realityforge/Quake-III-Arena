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

//#ifndef BOTLIB
//#define BOTLIB
//#endif //BOTLIB

#ifdef BOTLIB
#include "q_shared.h"
#include "qfiles.h"
#include "botlib.h"
#include "l_log.h"
#include "l_libvar.h"
#include "l_memory.h"
//#include "l_utils.h"
#include "be_interface.h"
#else //BOTLIB
#include "qbsp.h"
#include "l_mem.h"
#endif //BOTLIB

#ifdef BOTLIB
//========================================================================
//
// Parameter:				-
// Returns:					-
// Changes Globals:		-
//========================================================================
void Vector2Angles(vec3_t value1, vec3_t angles)
{
	float	forward;
	float	yaw, pitch;
	
	if (value1[1] == 0 && value1[0] == 0)
	{
		yaw = 0;
		if (value1[2] > 0) pitch = 90;
		else pitch = 270;
	}
	else
	{
		yaw = (int) (atan2(value1[1], value1[0]) * 180 / M_PI);
		if (yaw < 0) yaw += 360;

		forward = sqrt (value1[0]*value1[0] + value1[1]*value1[1]);
		pitch = (int) (atan2(value1[2], forward) * 180 / M_PI);
		if (pitch < 0) pitch += 360;
	}

	angles[PITCH] = -pitch;
	angles[YAW] = yaw;
	angles[ROLL] = 0;
}
#endif //BOTLIB
void ConvertPath(char *path)
{
	while(*path)
	{
		if (*path == '/' || *path == '\\') *path = PATHSEPERATOR_CHAR;
		path++;
	}
}
void AppendPathSeperator(char *path, int length)
{
	int pathlen = strlen(path);

	if (strlen(path) && length-pathlen > 1 && path[pathlen-1] != '/' && path[pathlen-1] != '\\')
	{
		path[pathlen] = PATHSEPERATOR_CHAR;
		path[pathlen+1] = '\0';
	}
}
