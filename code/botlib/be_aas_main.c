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

#include "../qcommon/q_shared.h"
#include "l_memory.h"
#include "l_libvar.h"
#include "l_utils.h"
#include "l_script.h"
#include "l_precomp.h"
#include "l_struct.h"
#include "l_log.h"
#include "aasfile.h"
#include "botlib.h"
#include "be_aas.h"
#include "be_aas_funcs.h"
#include "be_interface.h"
#include "be_aas_def.h"
#include "be_aas_main.h"

aas_t aasworld;

static libvar_t* saveroutingcache;

void QDECL AAS_Error(const char* fmt, ...)
{
    char str[1024];
    va_list arglist;

    va_start(arglist, fmt);
    vsnprintf(str, sizeof(str), fmt, arglist);
    va_end(arglist);
    botimport.Print(PRT_FATAL, "%s\n", str);
}
int AAS_Loaded()
{
    return aasworld.loaded;
}
int AAS_Initialized()
{
    return aasworld.initialized;
}
void AAS_SetInitialized()
{
    aasworld.initialized = true;
    botimport.Print(PRT_MESSAGE, "AAS initialized.\n");
}
static void AAS_ContinueInit()
{
    // if no AAS file loaded
    if (!aasworld.loaded)
        return;
    // if AAS is already initialized
    if (aasworld.initialized)
        return;
    // calculate reachability, if not finished return
    if (AAS_ContinueInitReachability())
        return;
    // initialize clustering for the new map
    AAS_InitClustering();
    // if reachability has been calculated and an AAS file should be written
    // or there is a forced data optimization
    if (aasworld.savefile || LibVarGetBoolValue("forcewrite")) {
        // optimize the AAS data
        if (LibVarBoolValue("aasoptimize", "0"))
            AAS_Optimize();
        // save the AAS file
        if (AAS_WriteAASFile(aasworld.filename)) {
            botimport.Print(PRT_MESSAGE, "%s written successfully\n", aasworld.filename);
        } else {
            botimport.Print(PRT_ERROR, "couldn't write %s\n", aasworld.filename);
        }
    }
    // initialize the routing
    AAS_InitRouting();
    // at this point AAS is initialized
    AAS_SetInitialized();
}
// called at the start of every frame
int AAS_StartFrame(float time)
{
    aasworld.time = time;
    // unlink all entities that were not updated last frame
    AAS_UnlinkInvalidEntities();
    // invalidate the entities
    AAS_InvalidateEntities();
    // initialize AAS
    AAS_ContinueInit();
    aasworld.frameroutingupdates = 0;
    if (saveroutingcache->value) {
        AAS_WriteRouteCache();
        LibVarSet("saveroutingcache", "0");
    }
    aasworld.numframes++;
    return BLERR_NOERROR;
}
float AAS_Time()
{
    return aasworld.time;
}
void AAS_ProjectPointOntoVector(vec3_t point, vec3_t vStart, vec3_t vEnd, vec3_t vProj)
{
    vec3_t pVec, vec;

    VectorSubtract(point, vStart, pVec);
    VectorSubtract(vEnd, vStart, vec);
    VectorNormalize(vec);
    // project onto the directional vector for this segment
    VectorMA(vStart, DotProduct(pVec, vec), vec, vProj);
}
static int AAS_LoadFiles(const char* mapname)
{
    int errnum;
    char aasfile[MAX_QPATH];

    strncpyz(aasworld.mapname, mapname, sizeof(aasworld.mapname));
    // NOTE: first reset the entity links into the AAS areas and BSP leaves
    //  the AAS link heap and BSP link heap are reset after respectively the
    //  AAS file and BSP file are loaded
    AAS_ResetEntityLinks();
    // load bsp info
    AAS_LoadBSPFile();

    // load the aas file
    Com_sprintf(aasfile, sizeof(aasfile), "maps/%s.aas", mapname);
    errnum = AAS_LoadAASFile(aasfile);
    if (errnum != BLERR_NOERROR)
        return errnum;

    botimport.Print(PRT_MESSAGE, "loaded %s\n", aasfile);
    strncpyz(aasworld.filename, aasfile, sizeof(aasworld.filename));
    return BLERR_NOERROR;
}
// called everytime a map changes
int AAS_LoadMap(const char* mapname)
{
    int errnum;

    // if no mapname is provided then the string indexes are updated
    if (!mapname) {
        return 0;
    }
    aasworld.initialized = false;
    // NOTE: free the routing caches before loading a new map because
    //  to free the caches the old number of areas, number of clusters
    //  and number of areas in a clusters must be available
    AAS_FreeRoutingCaches();
    // load the map
    errnum = AAS_LoadFiles(mapname);
    if (errnum != BLERR_NOERROR) {
        aasworld.loaded = false;
        return errnum;
    }
    AAS_InitSettings();
    // initialize the AAS link heap for the new map
    AAS_InitAASLinkHeap();
    // initialize the AAS linked entities for the new map
    AAS_InitAASLinkedEntities();
    // initialize reachability for the new map
    AAS_InitReachability();
    // initialize the alternative routing
    AAS_InitAlternativeRouting();
    // everything went ok
    return 0;
}
// called when the library is first loaded
int AAS_Setup()
{
    aasworld.maxclients = LibVarIntValue("maxclients", "128");
    aasworld.maxentities = LibVarIntValue("maxentities", "1024");
    // as soon as it's set to 1 the routing cache will be saved
    saveroutingcache = LibVar("saveroutingcache", "0");
    // allocate memory for the entities
    if (aasworld.entities)
        FreeMemory(aasworld.entities);
    aasworld.entities = (aas_entity_t*)GetClearedHunkMemory(aasworld.maxentities * sizeof(aas_entity_t));
    // invalidate all the entities
    AAS_InvalidateEntities();
    aasworld.numframes = 0;
    return BLERR_NOERROR;
}
void AAS_Shutdown()
{
    AAS_ShutdownAlternativeRouting();
    AAS_DumpBSPData();
    // free routing caches
    AAS_FreeRoutingCaches();
    // free aas link heap
    AAS_FreeAASLinkHeap();
    // free aas linked entities
    AAS_FreeAASLinkedEntities();
    // free the aas data
    AAS_DumpAASData();
    // free the entities
    if (aasworld.entities)
        FreeMemory(aasworld.entities);
    // clear the aasworld structure
    memset(&aasworld, 0, sizeof(aas_t));
    // aas has not been initialized
    aasworld.initialized = false;
    // NOTE: as soon as a new .bsp file is loaded the .bsp file memory is
    //  freed and reallocated, so there's no need to free that memory here
    // print shutdown
    botimport.Print(PRT_MESSAGE, "AAS shutdown.\n");
}
