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

#include "../game/q_shared.h"
#include "../bspc/l_log.h"
#include "../bspc/l_qfiles.h"
#include "../botlib/l_memory.h"
#include "../botlib/l_script.h"
#include "../botlib/l_precomp.h"
#include "../botlib/l_struct.h"
#include "../botlib/aasfile.h"
#include "../game/botlib.h"
#include "../game/be_aas.h"
#include "../botlib/be_aas_def.h"
#include "../qcommon/cm_public.h"

//#define BSPC

extern botlib_import_t botimport;
extern	qboolean capsule_collision;

botlib_import_t botimport;
clipHandle_t worldmodel;

void Error (char *error, ...);

void AAS_Error(char *fmt, ...)
{
	va_list argptr;
	char text[1024];

	va_start(argptr, fmt);
	vsprintf(text, fmt, argptr);
	va_end(argptr);

	Error(text);
}
int Sys_MilliSeconds(void)
{
	return clock() * 1000 / CLOCKS_PER_SEC;
}
void AAS_DebugLine(vec3_t start, vec3_t end, int color)
{
}
void AAS_ClearShownDebugLines(void)
{
}
char *BotImport_BSPEntityData(void)
{
	return CM_EntityString();
}
void BotImport_Trace(bsp_trace_t *bsptrace, vec3_t start, vec3_t mins, vec3_t maxs, vec3_t end, int passent, int contentmask)
{
	trace_t result;

	CM_BoxTrace(&result, start, end, mins, maxs, worldmodel, contentmask, capsule_collision);

	bsptrace->allsolid = result.allsolid;
	bsptrace->contents = result.contents;
	VectorCopy(result.endpos, bsptrace->endpos);
	bsptrace->ent = result.entityNum;
	bsptrace->fraction = result.fraction;
	bsptrace->exp_dist = 0;
	bsptrace->plane.dist = result.plane.dist;
	VectorCopy(result.plane.normal, bsptrace->plane.normal);
	bsptrace->plane.signbits = result.plane.signbits;
	bsptrace->plane.type = result.plane.type;
	bsptrace->sidenum = 0;
	bsptrace->startsolid = result.startsolid;
	bsptrace->surface.flags = result.surfaceFlags;
}
int BotImport_PointContents(vec3_t p)
{
	return CM_PointContents(p, worldmodel);
}
void *BotImport_GetMemory(int size)
{
	return GetMemory(size);
}
void BotImport_Print(int type, char *fmt, ...)
{
	va_list argptr;
	char buf[1024];

	va_start(argptr, fmt);
	vsprintf(buf, fmt, argptr);
	printf(buf);
	if (buf[0] != '\r') Log_Write(buf);
	va_end(argptr);
}
void BotImport_BSPModelMinsMaxsOrigin(int modelnum, vec3_t angles, vec3_t outmins, vec3_t outmaxs, vec3_t origin)
{
	clipHandle_t h;
	vec3_t mins, maxs;
	float max;
	int	i;

	h = CM_InlineModel(modelnum);
	CM_ModelBounds(h, mins, maxs);
	//if the model is rotated
	if ((angles[0] || angles[1] || angles[2]))
	{	// expand for rotation

		max = RadiusFromBounds(mins, maxs);
		for (i = 0; i < 3; i++)
		{
			mins[i] = (mins[i] + maxs[i]) * 0.5 - max;
			maxs[i] = (mins[i] + maxs[i]) * 0.5 + max;
		}
	}
	if (outmins) VectorCopy(mins, outmins);
	if (outmaxs) VectorCopy(maxs, outmaxs);
	if (origin) VectorClear(origin);
}
void Com_DPrintf(char *fmt, ...)
{
	va_list argptr;
	char buf[1024];

	va_start(argptr, fmt);
	vsprintf(buf, fmt, argptr);
	printf(buf);
	if (buf[0] != '\r') Log_Write(buf);
	va_end(argptr);
}
int COM_Compress( char *data_p ) {
	return strlen(data_p);
}
void AAS_InitBotImport(void)
{
	botimport.BSPEntityData = BotImport_BSPEntityData;
	botimport.GetMemory = BotImport_GetMemory;
	botimport.FreeMemory = FreeMemory;
	botimport.Trace = BotImport_Trace;
	botimport.PointContents = BotImport_PointContents;
	botimport.Print = BotImport_Print;
	botimport.BSPModelMinsMaxsOrigin = BotImport_BSPModelMinsMaxsOrigin;
}
void AAS_CalcReachAndClusters(struct quakefile_s *qf)
{
	float time;

	Log_Print("loading collision map...\n");
	//
	if (!qf->pakfile[0]) strcpy(qf->pakfile, qf->filename);
	//load the map
	CM_LoadMap((char *) qf, qfalse, &aasworld.bspchecksum);
	//get a handle to the world model
	worldmodel = CM_InlineModel(0);		// 0 = world, 1 + are bmodels
	//initialize bot import structure
	AAS_InitBotImport();
	//load the BSP entity string
	AAS_LoadBSPFile();
	//init physics settings
	AAS_InitSettings();
	//initialize AAS link heap
	AAS_InitAASLinkHeap();
	//initialize the AAS linked entities for the new map
	AAS_InitAASLinkedEntities();
	//reset all reachabilities and clusters
	aasworld.reachabilitysize = 0;
	aasworld.numclusters = 0;
	//set all view portals as cluster portals in case we re-calculate the reachabilities and clusters (with -reach)
	AAS_SetViewPortalsAsClusterPortals();
	//calculate reachabilities
	AAS_InitReachability();
	time = 0;
	while(AAS_ContinueInitReachability(time)) time++;
	//calculate clusters
	AAS_InitClustering();
}
