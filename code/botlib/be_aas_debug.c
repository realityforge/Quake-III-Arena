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

/*****************************************************************************
 * AAS debug code
 *****************************************************************************/

#include "../qcommon/q_shared.h"
#include "l_memory.h"
#include "l_script.h"
#include "l_precomp.h"
#include "l_struct.h"
#include "l_libvar.h"
#include "aasfile.h"
#include "botlib.h"
#include "be_aas.h"
#include "be_interface.h"
#include "be_aas_funcs.h"
#include "be_aas_def.h"
#include "be_aas_debug.h"

#define MAX_DEBUGLINES 1024
#define MAX_DEBUGPOLYGONS 8192

int debuglines[MAX_DEBUGLINES];
int debuglinevisible[MAX_DEBUGLINES];

static int debugpolygons[MAX_DEBUGPOLYGONS];

static void AAS_ShowPolygon(int color, int numpoints, vec3_t* points)
{
    int i;

    for (i = 0; i < MAX_DEBUGPOLYGONS; i++) {
        if (!debugpolygons[i]) {
            debugpolygons[i] = botimport.DebugPolygonCreate(color, numpoints, points);
            break;
        }
    }
}
void AAS_DebugLine(vec3_t start, vec3_t end, int color)
{
    int line;

    for (line = 0; line < MAX_DEBUGLINES; line++) {
        if (!debuglines[line]) {
            debuglines[line] = botimport.DebugLineCreate();
            debuglinevisible[line] = false;
        }
        if (!debuglinevisible[line]) {
            botimport.DebugLineShow(debuglines[line], start, end, color);
            debuglinevisible[line] = true;
            return;
        }
    }
}
void AAS_PermanentLine(vec3_t start, vec3_t end, int color)
{
    int line;

    line = botimport.DebugLineCreate();
    botimport.DebugLineShow(line, start, end, color);
}
static void AAS_ShowFacePolygon(int facenum, int color, int flip)
{
    int i, edgenum, numpoints;
    vec3_t points[128];
    aas_edge_t* edge;
    aas_face_t* face;

    // check if face number is in range
    if (facenum >= aasworld.numfaces) {
        botimport.Print(PRT_ERROR, "facenum %d out of range\n", facenum);
    }
    face = &aasworld.faces[facenum];
    // walk through the edges of the face
    numpoints = 0;
    if (flip) {
        for (i = face->numedges - 1; i >= 0; i--) {
            // edge number
            edgenum = aasworld.edgeindex[face->firstedge + i];
            edge = &aasworld.edges[abs(edgenum)];
            VectorCopy(aasworld.vertexes[edge->v[edgenum < 0]], points[numpoints]);
            numpoints++;
        }
    } else {
        for (i = 0; i < face->numedges; i++) {
            // edge number
            edgenum = aasworld.edgeindex[face->firstedge + i];
            edge = &aasworld.edges[abs(edgenum)];
            VectorCopy(aasworld.vertexes[edge->v[edgenum < 0]], points[numpoints]);
            numpoints++;
        }
    }
    AAS_ShowPolygon(color, numpoints, points);
}
void AAS_ShowAreaPolygons(int areanum, int color, int groundfacesonly)
{
    int i, facenum;
    aas_area_t* area;
    aas_face_t* face;

    if (areanum < 0 || areanum >= aasworld.numareas) {
        botimport.Print(PRT_ERROR, "area %d out of range [0, %d]\n",
                        areanum, aasworld.numareas);
        return;
    }
    // pointer to the convex area
    area = &aasworld.areas[areanum];
    // walk through the faces of the area
    for (i = 0; i < area->numfaces; i++) {
        facenum = abs(aasworld.faceindex[area->firstface + i]);
        // check if face number is in range
        if (facenum >= aasworld.numfaces) {
            botimport.Print(PRT_ERROR, "facenum %d out of range\n", facenum);
        }
        face = &aasworld.faces[facenum];
        // ground faces only
        if (groundfacesonly) {
            if (!(face->faceflags & (FACE_GROUND | FACE_LADDER)))
                continue;
        }
        AAS_ShowFacePolygon(facenum, color, face->frontarea != areanum);
    }
}
#ifdef DEBUG
void AAS_PrintTravelType(int traveltype)
{
    char* str;
    switch (traveltype & TRAVELTYPE_MASK) {
    case TRAVEL_INVALID:
        str = "TRAVEL_INVALID";
        break;
    case TRAVEL_WALK:
        str = "TRAVEL_WALK";
        break;
    case TRAVEL_CROUCH:
        str = "TRAVEL_CROUCH";
        break;
    case TRAVEL_BARRIERJUMP:
        str = "TRAVEL_BARRIERJUMP";
        break;
    case TRAVEL_JUMP:
        str = "TRAVEL_JUMP";
        break;
    case TRAVEL_LADDER:
        str = "TRAVEL_LADDER";
        break;
    case TRAVEL_WALKOFFLEDGE:
        str = "TRAVEL_WALKOFFLEDGE";
        break;
    case TRAVEL_SWIM:
        str = "TRAVEL_SWIM";
        break;
    case TRAVEL_WATERJUMP:
        str = "TRAVEL_WATERJUMP";
        break;
    case TRAVEL_TELEPORT:
        str = "TRAVEL_TELEPORT";
        break;
    case TRAVEL_ELEVATOR:
        str = "TRAVEL_ELEVATOR";
        break;
    case TRAVEL_ROCKETJUMP:
        str = "TRAVEL_ROCKETJUMP";
        break;
    case TRAVEL_BFGJUMP:
        str = "TRAVEL_BFGJUMP";
        break;
    case TRAVEL_GRAPPLEHOOK:
        str = "TRAVEL_GRAPPLEHOOK";
        break;
    case TRAVEL_JUMPPAD:
        str = "TRAVEL_JUMPPAD";
        break;
    case TRAVEL_FUNCBOB:
        str = "TRAVEL_FUNCBOB";
        break;
    default:
        str = "UNKNOWN TRAVEL TYPE";
        break;
    }
    botimport.Print(PRT_MESSAGE, "%s", str);
}
#endif
