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
 * BSP, Environment Sampling
 *****************************************************************************/

#include "../qcommon/q_shared.h"
#include "l_memory.h"
#include "l_script.h"
#include "l_precomp.h"
#include "l_struct.h"
#include "aasfile.h"
#include "botlib.h"
#include "be_aas.h"
#include "be_aas_def.h"
#include "be_aas_bsp.h"

extern botlib_import_t botimport;

#define MAX_BSPENTITIES 2048

// bsp entity epair
typedef struct bsp_epair_s {
    char* key;
    char* value;
    struct bsp_epair_s* next;
} bsp_epair_t;

// bsp data entity
typedef struct bsp_entity_s {
    bsp_epair_t* epairs;
} bsp_entity_t;

// id Software BSP data
typedef struct bsp_s {
    // true when bsp file is loaded
    int loaded;
    // entity data
    int entdatasize;
    char* dentdata;
    // bsp entities
    int numentities;
    bsp_entity_t entities[MAX_BSPENTITIES];
} bsp_t;

// global bsp
static bsp_t bspworld;

// traces axial boxes of any size through the world
bsp_trace_t AAS_Trace(vec3_t start, vec3_t mins, vec3_t maxs, vec3_t end, int passent, int contentmask)
{
    bsp_trace_t bsptrace;
    botimport.Trace(&bsptrace, start, mins, maxs, end, passent, contentmask);
    return bsptrace;
}
// returns the contents at the given point
int AAS_PointContents(vec3_t point)
{
    return botimport.PointContents(point);
}
bool AAS_EntityCollision(int entnum,
                         vec3_t start, vec3_t boxmins, vec3_t boxmaxs, vec3_t end,
                         int contentmask, bsp_trace_t* trace)
{
    bsp_trace_t enttrace;

    botimport.EntityTrace(&enttrace, start, boxmins, boxmaxs, end, entnum, contentmask);
    if (enttrace.fraction < trace->fraction) {
        memcpy(trace, &enttrace, sizeof(bsp_trace_t));
        return true;
    }
    return false;
}
void AAS_BSPModelMinsMaxsOrigin(int modelnum, vec3_t angles, vec3_t mins, vec3_t maxs, vec3_t origin)
{
    botimport.BSPModelMinsMaxsOrigin(modelnum, angles, mins, maxs, origin);
}
int AAS_NextBSPEntity(int ent)
{
    ent++;
    if (ent >= 1 && ent < bspworld.numentities)
        return ent;
    return 0;
}
static int AAS_BSPEntityInRange(int ent)
{
    if (ent <= 0 || ent >= bspworld.numentities) {
        botimport.Print(PRT_MESSAGE, "bsp entity out of range\n");
        return false;
    }
    return true;
}
int AAS_ValueForBSPEpairKey(int ent, char* key, char* value, int size)
{
    bsp_epair_t* epair;

    value[0] = '\0';
    if (!AAS_BSPEntityInRange(ent))
        return false;
    for (epair = bspworld.entities[ent].epairs; epair; epair = epair->next) {
        if (!strcmp(epair->key, key)) {
            strncpyz(value, epair->value, size);
            return true;
        }
    }
    return false;
}
int AAS_VectorForBSPEpairKey(int ent, char* key, vec3_t v)
{
    VectorClear(v);

    char buf[MAX_EPAIRKEY];
    if (AAS_ValueForBSPEpairKey(ent, key, buf, MAX_EPAIRKEY) != 0) {
        v[0] = v[1] = v[2] = 0;
        sscanf(buf, "%f %f %f", &v[0], &v[1], &v[2]);
        return true;
    } else {
        return false;
    }
}
int AAS_FloatForBSPEpairKey(int ent, char* key, float* value)
{
    char buf[MAX_EPAIRKEY];

    *value = 0;
    if (!AAS_ValueForBSPEpairKey(ent, key, buf, MAX_EPAIRKEY))
        return false;
    *value = (float)(atof(buf));
    return true;
}
int AAS_IntForBSPEpairKey(int ent, char* key, int* value)
{
    char buf[MAX_EPAIRKEY];

    *value = 0;
    if (!AAS_ValueForBSPEpairKey(ent, key, buf, MAX_EPAIRKEY))
        return false;
    *value = atoi(buf);
    return true;
}
static void AAS_FreeBSPEntities()
{
    int i;
    bsp_entity_t* ent;
    bsp_epair_t *epair, *nextepair;

    for (i = 1; i < bspworld.numentities; i++) {
        ent = &bspworld.entities[i];
        for (epair = ent->epairs; epair; epair = nextepair) {
            nextepair = epair->next;
            if (epair->key)
                FreeMemory(epair->key);
            if (epair->value)
                FreeMemory(epair->value);
            FreeMemory(epair);
        }
    }
    bspworld.numentities = 0;
}
static void AAS_ParseBSPEntities()
{
    script_t* script;
    token_t token;
    bsp_entity_t* ent;
    bsp_epair_t* epair;

    script = LoadScriptMemory(bspworld.dentdata, bspworld.entdatasize, "entdata");
    SetScriptFlags(script, SCFL_NOSTRINGWHITESPACES | SCFL_NOSTRINGESCAPECHARS); // SCFL_PRIMITIVE);

    bspworld.numentities = 1;

    while (PS_ReadToken(script, &token)) {
        if (strcmp(token.string, "{")) {
            ScriptError(script, "invalid %s", token.string);
            AAS_FreeBSPEntities();
            FreeScript(script);
            return;
        }
        if (bspworld.numentities >= MAX_BSPENTITIES) {
            botimport.Print(PRT_MESSAGE, "too many entities in BSP file\n");
            break;
        }
        ent = &bspworld.entities[bspworld.numentities];
        bspworld.numentities++;
        ent->epairs = NULL;
        while (PS_ReadToken(script, &token)) {
            if (!strcmp(token.string, "}"))
                break;
            epair = (bsp_epair_t*)GetClearedHunkMemory(sizeof(bsp_epair_t));
            epair->next = ent->epairs;
            ent->epairs = epair;
            if (token.type != TT_STRING) {
                ScriptError(script, "invalid %s", token.string);
                AAS_FreeBSPEntities();
                FreeScript(script);
                return;
            }
            StripDoubleQuotes(token.string);
            epair->key = (char*)GetHunkMemory(strlen(token.string) + 1);
            strcpy(epair->key, token.string);
            if (!PS_ExpectTokenType(script, TT_STRING, 0, &token)) {
                AAS_FreeBSPEntities();
                FreeScript(script);
                return;
            }
            StripDoubleQuotes(token.string);
            epair->value = (char*)GetHunkMemory(strlen(token.string) + 1);
            strcpy(epair->value, token.string);
        }
        if (strcmp(token.string, "}")) {
            ScriptError(script, "missing }");
            AAS_FreeBSPEntities();
            FreeScript(script);
            return;
        }
    }
    FreeScript(script);
}
void AAS_DumpBSPData()
{
    AAS_FreeBSPEntities();

    if (bspworld.dentdata)
        FreeMemory(bspworld.dentdata);
    bspworld.dentdata = NULL;
    bspworld.entdatasize = 0;
    bspworld.loaded = false;
    memset(&bspworld, 0, sizeof(bspworld));
}
// load a bsp file
int AAS_LoadBSPFile()
{
    AAS_DumpBSPData();
    bspworld.entdatasize = strlen(botimport.BSPEntityData()) + 1;
    bspworld.dentdata = (char*)GetClearedHunkMemory(bspworld.entdatasize);
    memcpy(bspworld.dentdata, botimport.BSPEntityData(), bspworld.entdatasize);
    AAS_ParseBSPEntities();
    bspworld.loaded = true;
    return BLERR_NOERROR;
}
