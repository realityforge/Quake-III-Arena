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

#define MAX_DEBUGLINES 1024
#define MAX_DEBUGPOLYGONS 8192

int debuglines[MAX_DEBUGLINES];
int debuglinevisible[MAX_DEBUGLINES];
int numdebuglines;

static int debugpolygons[MAX_DEBUGPOLYGONS];

void AAS_ShowPolygon(int color, int numpoints, vec3_t* points)
{
    int i;

    for (i = 0; i < MAX_DEBUGPOLYGONS; i++) {
        if (!debugpolygons[i]) {
            debugpolygons[i] = botimport.DebugPolygonCreate(color, numpoints, points);
            break;
        }
    }
}
void AAS_ClearShownDebugLines(void)
{
    int i;

    // make all lines invisible
    for (i = 0; i < MAX_DEBUGLINES; i++) {
        if (debuglines[i]) {
            botimport.DebugLineDelete(debuglines[i]);
            debuglines[i] = 0;
            debuglinevisible[i] = qfalse;
        }
    }
}
void AAS_DebugLine(vec3_t start, vec3_t end, int color)
{
    int line;

    for (line = 0; line < MAX_DEBUGLINES; line++) {
        if (!debuglines[line]) {
            debuglines[line] = botimport.DebugLineCreate();
            debuglinevisible[line] = qfalse;
            numdebuglines++;
        }
        if (!debuglinevisible[line]) {
            botimport.DebugLineShow(debuglines[line], start, end, color);
            debuglinevisible[line] = qtrue;
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
void AAS_ShowFacePolygon(int facenum, int color, int flip)
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
void AAS_DrawCross(vec3_t origin, float size, int color)
{
    int i;
    vec3_t start, end;

    for (i = 0; i < 3; i++) {
        VectorCopy(origin, start);
        start[i] += size;
        VectorCopy(origin, end);
        end[i] -= size;
        AAS_DebugLine(start, end, color);
    }
}
void AAS_PrintTravelType(int traveltype)
{
#ifdef DEBUG
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
#endif
}
void AAS_DrawArrow(vec3_t start, vec3_t end, int linecolor, int arrowcolor)
{
    vec3_t dir, cross, p1, p2, up = { 0, 0, 1 };
    float dot;

    VectorSubtract(end, start, dir);
    VectorNormalize(dir);
    dot = DotProduct(dir, up);
    if (dot > 0.99 || dot < -0.99)
        VectorSet(cross, 1, 0, 0);
    else
        CrossProduct(dir, up, cross);

    VectorMA(end, -6, dir, p1);
    VectorCopy(p1, p2);
    VectorMA(p1, 6, cross, p1);
    VectorMA(p2, -6, cross, p2);

    AAS_DebugLine(start, end, linecolor);
    AAS_DebugLine(p1, end, arrowcolor);
    AAS_DebugLine(p2, end, arrowcolor);
}
void AAS_ShowReachability(aas_reachability_t* reach)
{
    vec3_t dir, cmdmove, velocity;
    float speed, zvel;
    aas_clientmove_t move;

    AAS_ShowAreaPolygons(reach->areanum, 5, qtrue);
    AAS_DrawArrow(reach->start, reach->end, LINECOLOR_BLUE, LINECOLOR_YELLOW);
    if ((reach->traveltype & TRAVELTYPE_MASK) == TRAVEL_JUMP || (reach->traveltype & TRAVELTYPE_MASK) == TRAVEL_WALKOFFLEDGE) {
        AAS_HorizontalVelocityForJump(aassettings.phys_jumpvel, reach->start, reach->end, &speed);
        VectorSubtract(reach->end, reach->start, dir);
        dir[2] = 0;
        VectorNormalize(dir);
        // set the velocity
        VectorScale(dir, speed, velocity);
        // set the command movement
        VectorClear(cmdmove);
        cmdmove[2] = aassettings.phys_jumpvel;
        AAS_PredictClientMovement(&move, -1, reach->start, PRESENCE_NORMAL, qtrue,
                                  velocity, cmdmove, 3, 30, 0.1f,
                                  SE_HITGROUND | SE_ENTERWATER | SE_ENTERSLIME | SE_ENTERLAVA | SE_HITGROUNDDAMAGE, 0, qtrue);
        if ((reach->traveltype & TRAVELTYPE_MASK) == TRAVEL_JUMP) {
            AAS_JumpReachRunStart(reach, dir);
            AAS_DrawCross(dir, 4, LINECOLOR_BLUE);
        }
    } else if ((reach->traveltype & TRAVELTYPE_MASK) == TRAVEL_ROCKETJUMP) {
        zvel = AAS_RocketJumpZVelocity(reach->start);
        AAS_HorizontalVelocityForJump(zvel, reach->start, reach->end, &speed);
        VectorSubtract(reach->end, reach->start, dir);
        dir[2] = 0;
        VectorNormalize(dir);
        // get command movement
        VectorScale(dir, speed, cmdmove);
        VectorSet(velocity, 0, 0, zvel);
        AAS_PredictClientMovement(&move, -1, reach->start, PRESENCE_NORMAL, qtrue,
                                  velocity, cmdmove, 30, 30, 0.1f,
                                  SE_ENTERWATER | SE_ENTERSLIME | SE_ENTERLAVA | SE_HITGROUNDDAMAGE | SE_TOUCHJUMPPAD | SE_HITGROUNDAREA, reach->areanum, qtrue);
    } else if ((reach->traveltype & TRAVELTYPE_MASK) == TRAVEL_JUMPPAD) {
        VectorSet(cmdmove, 0, 0, 0);
        VectorSubtract(reach->end, reach->start, dir);
        dir[2] = 0;
        VectorNormalize(dir);
        // set the velocity
        // NOTE: the edgenum is the horizontal velocity
        VectorScale(dir, reach->edgenum, velocity);
        // NOTE: the facenum is the Z velocity
        velocity[2] = reach->facenum;
        AAS_PredictClientMovement(&move, -1, reach->start, PRESENCE_NORMAL, qtrue,
                                  velocity, cmdmove, 30, 30, 0.1f,
                                  SE_ENTERWATER | SE_ENTERSLIME | SE_ENTERLAVA | SE_HITGROUNDDAMAGE | SE_TOUCHJUMPPAD | SE_HITGROUNDAREA, reach->areanum, qtrue);
    }
}
void AAS_FloodAreas_r(int areanum, int cluster, int* done)
{
    int nextareanum, i, facenum;
    aas_area_t* area;
    aas_face_t* face;
    aas_areasettings_t* settings;
    aas_reachability_t* reach;

    AAS_ShowAreaPolygons(areanum, 1, qtrue);
    // pointer to the convex area
    area = &aasworld.areas[areanum];
    settings = &aasworld.areasettings[areanum];
    // walk through the faces of the area
    for (i = 0; i < area->numfaces; i++) {
        facenum = abs(aasworld.faceindex[area->firstface + i]);
        face = &aasworld.faces[facenum];
        if (face->frontarea == areanum)
            nextareanum = face->backarea;
        else
            nextareanum = face->frontarea;
        if (!nextareanum)
            continue;
        if (done[nextareanum])
            continue;
        done[nextareanum] = qtrue;
        if (aasworld.areasettings[nextareanum].contents & AREACONTENTS_VIEWPORTAL)
            continue;
        if (AAS_AreaCluster(nextareanum) != cluster)
            continue;
        AAS_FloodAreas_r(nextareanum, cluster, done);
    }
    for (i = 0; i < settings->numreachableareas; i++) {
        reach = &aasworld.reachability[settings->firstreachablearea + i];
        nextareanum = reach->areanum;
        if (!nextareanum)
            continue;
        if (done[nextareanum])
            continue;
        done[nextareanum] = qtrue;
        if (aasworld.areasettings[nextareanum].contents & AREACONTENTS_VIEWPORTAL)
            continue;
        if (AAS_AreaCluster(nextareanum) != cluster)
            continue;
        AAS_FloodAreas_r(nextareanum, cluster, done);
    }
}
