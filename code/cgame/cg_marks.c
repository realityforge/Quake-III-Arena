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
// cg_marks.c -- wall marks

#include "cg_local.h"

/*
===================================================================

MARK POLYS

===================================================================
*/

markPoly_t cg_activeMarkPolys; // double linked list
markPoly_t* cg_freeMarkPolys; // single linked list
markPoly_t cg_markPolys[MAX_MARK_POLYS];
static int markTotal;

/*
===================
CG_InitMarkPolys

This is called at startup and for tournament restarts
===================
*/
void CG_InitMarkPolys()
{
    int i;

    memset(cg_markPolys, 0, sizeof(cg_markPolys));

    cg_activeMarkPolys.nextMark = &cg_activeMarkPolys;
    cg_activeMarkPolys.prevMark = &cg_activeMarkPolys;
    cg_freeMarkPolys = cg_markPolys;
    for (i = 0; i < MAX_MARK_POLYS - 1; i++) {
        cg_markPolys[i].nextMark = &cg_markPolys[i + 1];
    }
}

void CG_FreeMarkPoly(markPoly_t* le)
{
    if (!le->prevMark) {
        CG_Error("CG_FreeLocalEntity: not active");
    }

    // remove from the doubly linked active list
    le->prevMark->nextMark = le->nextMark;
    le->nextMark->prevMark = le->prevMark;

    // the free list is only singly linked
    le->nextMark = cg_freeMarkPolys;
    cg_freeMarkPolys = le;
}

/*
===================
CG_AllocMark

Will always succeed, even if it requires freeing an old active mark
===================
*/
markPoly_t* CG_AllocMark()
{
    markPoly_t* le;
    int time;

    if (!cg_freeMarkPolys) {
        // no free entities, so free the one at the end of the chain
        // remove the oldest active entity
        time = cg_activeMarkPolys.prevMark->time;
        while (cg_activeMarkPolys.prevMark && time == cg_activeMarkPolys.prevMark->time) {
            CG_FreeMarkPoly(cg_activeMarkPolys.prevMark);
        }
    }

    le = cg_freeMarkPolys;
    cg_freeMarkPolys = cg_freeMarkPolys->nextMark;

    memset(le, 0, sizeof(*le));

    // link into the active list
    le->nextMark = cg_activeMarkPolys.nextMark;
    le->prevMark = &cg_activeMarkPolys;
    cg_activeMarkPolys.nextMark->prevMark = le;
    cg_activeMarkPolys.nextMark = le;
    return le;
}

/*
=================
CG_ImpactMark

origin should be a point within a unit of the plane
dir should be the plane normal

temporary marks will not be stored or randomly oriented, but immediately
passed to the renderer.
=================
*/
#define MAX_MARK_FRAGMENTS 128
#define MAX_MARK_POINTS 384

void CG_ImpactMark(qhandle_t markShader, const vec3_t origin, const vec3_t dir,
                   float orientation, float red, float green, float blue, float alpha,
                   bool alphaFade, float radius, bool temporary)
{
    vec3_t axis[3];
    float texCoordScale;
    vec3_t originalPoints[4];
    uint8_t colors[4];
    int i, j;
    int numFragments;
    markFragment_t markFragments[MAX_MARK_FRAGMENTS], *mf;
    vec3_t markPoints[MAX_MARK_POINTS];
    vec3_t projection;

    if (!cg_addMarks.integer) {
        return;
    }

    if (radius <= 0) {
        CG_Error("CG_ImpactMark called with <= 0 radius");
    }

    // if ( markTotal >= MAX_MARK_POLYS ) {
    //	return;
    // }

    // create the texture axis
    VectorNormalize2(dir, axis[0]);
    PerpendicularVector(axis[1], axis[0]);
    RotatePointAroundVector(axis[2], axis[0], axis[1], orientation);
    CrossProduct(axis[0], axis[2], axis[1]);

    texCoordScale = 0.5 * 1.0 / radius;

    // create the full polygon
    for (i = 0; i < 3; i++) {
        originalPoints[0][i] = origin[i] - radius * axis[1][i] - radius * axis[2][i];
        originalPoints[1][i] = origin[i] + radius * axis[1][i] - radius * axis[2][i];
        originalPoints[2][i] = origin[i] + radius * axis[1][i] + radius * axis[2][i];
        originalPoints[3][i] = origin[i] - radius * axis[1][i] + radius * axis[2][i];
    }

    // get the fragments
    VectorScale(dir, -20, projection);
    numFragments = trap_CM_MarkFragments(4, (void*)originalPoints,
                                         projection, MAX_MARK_POINTS, markPoints[0],
                                         MAX_MARK_FRAGMENTS, markFragments);

    colors[0] = red * 255;
    colors[1] = green * 255;
    colors[2] = blue * 255;
    colors[3] = alpha * 255;

    for (i = 0, mf = markFragments; i < numFragments; i++, mf++) {
        polyVert_t* v;
        polyVert_t verts[MAX_VERTS_ON_POLY];
        markPoly_t* mark;

        // we have an upper limit on the complexity of polygons
        // that we store persistantly
        if (mf->numPoints > MAX_VERTS_ON_POLY) {
            mf->numPoints = MAX_VERTS_ON_POLY;
        }
        for (j = 0, v = verts; j < mf->numPoints; j++, v++) {
            vec3_t delta;

            VectorCopy(markPoints[mf->firstPoint + j], v->xyz);

            VectorSubtract(v->xyz, origin, delta);
            v->st[0] = 0.5 + DotProduct(delta, axis[1]) * texCoordScale;
            v->st[1] = 0.5 + DotProduct(delta, axis[2]) * texCoordScale;
            *(int*)v->modulate = *(int*)colors;
        }

        // if it is a temporary (shadow) mark, add it immediately and forget about it
        if (temporary) {
            trap_R_AddPolyToScene(markShader, mf->numPoints, verts);
            continue;
        }

        // otherwise save it persistantly
        mark = CG_AllocMark();
        mark->time = cg.time;
        mark->alphaFade = alphaFade;
        mark->markShader = markShader;
        mark->poly.numVerts = mf->numPoints;
        mark->color[0] = red;
        mark->color[1] = green;
        mark->color[2] = blue;
        mark->color[3] = alpha;
        memcpy(mark->verts, verts, mf->numPoints * sizeof(verts[0]));
        markTotal++;
    }
}

#define MARK_TOTAL_TIME 10000
#define MARK_FADE_TIME 1000

void CG_AddMarks()
{
    int j;
    markPoly_t *mp, *next;
    int t;
    int fade;

    if (!cg_addMarks.integer) {
        return;
    }

    mp = cg_activeMarkPolys.nextMark;
    for (; mp != &cg_activeMarkPolys; mp = next) {
        // grab next now, so if the local entity is freed we
        // still have it
        next = mp->nextMark;

        // see if it is time to completely remove it
        if (cg.time > mp->time + MARK_TOTAL_TIME) {
            CG_FreeMarkPoly(mp);
            continue;
        }

        // fade out the energy bursts
        if (mp->markShader == cgs.media.energyMarkShader) {

            fade = 450 - 450 * ((cg.time - mp->time) / 3000.0);
            if (fade < 255) {
                if (fade < 0) {
                    fade = 0;
                }
                if (mp->verts[0].modulate[0] != 0) {
                    for (j = 0; j < mp->poly.numVerts; j++) {
                        mp->verts[j].modulate[0] = mp->color[0] * fade;
                        mp->verts[j].modulate[1] = mp->color[1] * fade;
                        mp->verts[j].modulate[2] = mp->color[2] * fade;
                    }
                }
            }
        }

        // fade all marks out with time
        t = mp->time + MARK_TOTAL_TIME - cg.time;
        if (t < MARK_FADE_TIME) {
            fade = 255 * t / MARK_FADE_TIME;
            if (mp->alphaFade) {
                for (j = 0; j < mp->poly.numVerts; j++) {
                    mp->verts[j].modulate[3] = fade;
                }
            } else {
                for (j = 0; j < mp->poly.numVerts; j++) {
                    mp->verts[j].modulate[0] = mp->color[0] * fade;
                    mp->verts[j].modulate[1] = mp->color[1] * fade;
                    mp->verts[j].modulate[2] = mp->color[2] * fade;
                }
            }
        }

        trap_R_AddPolyToScene(mp->markShader, mp->poly.numVerts, mp->verts);
    }
}

// cg_particles.c

#define BLOODRED 2
#define EMISIVEFADE 3
#define GREY75 4

typedef struct particle_s {
    struct particle_s* next;

    float time;
    float endtime;

    vec3_t org;
    vec3_t vel;
    vec3_t accel;
    int color;
    float alpha;
    float alphavel;
    int type;
    qhandle_t pshader;

    float height;
    float width;

    float endheight;
    float endwidth;

    float start;
    float end;

    float startfade;
    bool rotate;

    bool link;

    // Ridah
    int shaderAnim;
    int roll;

    int accumroll;

} cparticle_t;

typedef enum {
    P_NONE,
    P_WEATHER,
    P_FLAT,
    P_SMOKE,
    P_ROTATE,
    P_WEATHER_TURBULENT,
    P_ANIM, // Ridah
    P_BAT,
    P_BLEED,
    P_FLAT_SCALEUP,
    P_FLAT_SCALEUP_FADE,
    P_WEATHER_FLURRY,
    P_SMOKE_IMPACT,
    P_BUBBLE,
    P_BUBBLE_TURBULENT,
    P_SPRITE
} particle_type_t;

#define MAX_SHADER_ANIMS 32
#define MAX_SHADER_ANIM_FRAMES 64

static char* shaderAnimNames[MAX_SHADER_ANIMS] = {
    "explode1",
    NULL
};
static qhandle_t shaderAnims[MAX_SHADER_ANIMS][MAX_SHADER_ANIM_FRAMES];
static int shaderAnimCounts[MAX_SHADER_ANIMS] = {
    23
};
static float shaderAnimSTRatio[MAX_SHADER_ANIMS] = {
    1.0f
};
// done.

#define PARTICLE_GRAVITY 40
#define MAX_PARTICLES 1024

cparticle_t *active_particles, *free_particles;
cparticle_t particles[MAX_PARTICLES];
int cl_numparticles = MAX_PARTICLES;

bool initparticles = false;
vec3_t pvforward, pvright, pvup;
vec3_t rforward, rright, rup;

float oldtime;

void CG_ClearParticles()
{
    int i;

    memset(particles, 0, sizeof(particles));

    free_particles = &particles[0];
    active_particles = NULL;

    for (i = 0; i < cl_numparticles; i++) {
        particles[i].next = &particles[i + 1];
        particles[i].type = 0;
    }
    particles[cl_numparticles - 1].next = NULL;

    oldtime = cg.time;

    // Ridah, init the shaderAnims
    for (i = 0; shaderAnimNames[i]; i++) {
        int j;

        for (j = 0; j < shaderAnimCounts[i]; j++) {
            shaderAnims[i][j] = trap_R_RegisterShader(va("%s%i", shaderAnimNames[i], j + 1));
        }
    }
    // done.

    initparticles = true;
}

void CG_AddParticleToScene(cparticle_t* p, vec3_t org, float alpha)
{

    vec3_t point;
    polyVert_t verts[4];
    float width;
    float height;
    float time, time2;
    float ratio;
    float invratio;
    vec3_t color;
    polyVert_t TRIverts[3];
    vec3_t rright2, rup2;

    if (p->type == P_WEATHER || p->type == P_WEATHER_TURBULENT || p->type == P_WEATHER_FLURRY
        || p->type == P_BUBBLE || p->type == P_BUBBLE_TURBULENT) { // create a front facing polygon

        if (p->type != P_WEATHER_FLURRY) {
            if (p->type == P_BUBBLE || p->type == P_BUBBLE_TURBULENT) {
                if (org[2] > p->end) {
                    p->time = cg.time;
                    VectorCopy(org, p->org); // Ridah, fixes rare snow flakes that flicker on the ground

                    p->org[2] = (p->start + crandom() * 4);

                    if (p->type == P_BUBBLE_TURBULENT) {
                        p->vel[0] = crandom() * 4;
                        p->vel[1] = crandom() * 4;
                    }
                }
            } else {
                if (org[2] < p->end) {
                    p->time = cg.time;
                    VectorCopy(org, p->org); // Ridah, fixes rare snow flakes that flicker on the ground

                    while (p->org[2] < p->end) {
                        p->org[2] += (p->start - p->end);
                    }

                    if (p->type == P_WEATHER_TURBULENT) {
                        p->vel[0] = crandom() * 16;
                        p->vel[1] = crandom() * 16;
                    }
                }
            }

            // Rafael snow pvs check
            if (!p->link)
                return;

            p->alpha = 1;
        }

        // Ridah, had to do this or MAX_POLYS is being exceeded in village1.bsp
        if (Distance(cg.snap->ps.origin, org) > 1024) {
            return;
        }
        // done.

        if (p->type == P_BUBBLE || p->type == P_BUBBLE_TURBULENT) {
            VectorMA(org, -p->height, pvup, point);
            VectorMA(point, -p->width, pvright, point);
            VectorCopy(point, verts[0].xyz);
            verts[0].st[0] = 0;
            verts[0].st[1] = 0;
            verts[0].modulate[0] = 255;
            verts[0].modulate[1] = 255;
            verts[0].modulate[2] = 255;
            verts[0].modulate[3] = 255 * p->alpha;

            VectorMA(org, -p->height, pvup, point);
            VectorMA(point, p->width, pvright, point);
            VectorCopy(point, verts[1].xyz);
            verts[1].st[0] = 0;
            verts[1].st[1] = 1;
            verts[1].modulate[0] = 255;
            verts[1].modulate[1] = 255;
            verts[1].modulate[2] = 255;
            verts[1].modulate[3] = 255 * p->alpha;

            VectorMA(org, p->height, pvup, point);
            VectorMA(point, p->width, pvright, point);
            VectorCopy(point, verts[2].xyz);
            verts[2].st[0] = 1;
            verts[2].st[1] = 1;
            verts[2].modulate[0] = 255;
            verts[2].modulate[1] = 255;
            verts[2].modulate[2] = 255;
            verts[2].modulate[3] = 255 * p->alpha;

            VectorMA(org, p->height, pvup, point);
            VectorMA(point, -p->width, pvright, point);
            VectorCopy(point, verts[3].xyz);
            verts[3].st[0] = 1;
            verts[3].st[1] = 0;
            verts[3].modulate[0] = 255;
            verts[3].modulate[1] = 255;
            verts[3].modulate[2] = 255;
            verts[3].modulate[3] = 255 * p->alpha;
        } else {
            VectorMA(org, -p->height, pvup, point);
            VectorMA(point, -p->width, pvright, point);
            VectorCopy(point, TRIverts[0].xyz);
            TRIverts[0].st[0] = 1;
            TRIverts[0].st[1] = 0;
            TRIverts[0].modulate[0] = 255;
            TRIverts[0].modulate[1] = 255;
            TRIverts[0].modulate[2] = 255;
            TRIverts[0].modulate[3] = 255 * p->alpha;

            VectorMA(org, p->height, pvup, point);
            VectorMA(point, -p->width, pvright, point);
            VectorCopy(point, TRIverts[1].xyz);
            TRIverts[1].st[0] = 0;
            TRIverts[1].st[1] = 0;
            TRIverts[1].modulate[0] = 255;
            TRIverts[1].modulate[1] = 255;
            TRIverts[1].modulate[2] = 255;
            TRIverts[1].modulate[3] = 255 * p->alpha;

            VectorMA(org, p->height, pvup, point);
            VectorMA(point, p->width, pvright, point);
            VectorCopy(point, TRIverts[2].xyz);
            TRIverts[2].st[0] = 0;
            TRIverts[2].st[1] = 1;
            TRIverts[2].modulate[0] = 255;
            TRIverts[2].modulate[1] = 255;
            TRIverts[2].modulate[2] = 255;
            TRIverts[2].modulate[3] = 255 * p->alpha;
        }

    } else if (p->type == P_SPRITE) {
        vec3_t rr, ru;
        vec3_t rotate_ang;

        VectorSet(color, 1.0, 1.0, 0.5);
        time = cg.time - p->time;
        time2 = p->endtime - p->time;
        ratio = time / time2;

        width = p->width + (ratio * (p->endwidth - p->width));
        height = p->height + (ratio * (p->endheight - p->height));

        if (p->roll) {
            vectoangles(cg.refdef.viewaxis[0], rotate_ang);
            rotate_ang[ROLL] += p->roll;
            AngleVectors(rotate_ang, NULL, rr, ru);
        }

        if (p->roll) {
            VectorMA(org, -height, ru, point);
            VectorMA(point, -width, rr, point);
        } else {
            VectorMA(org, -height, pvup, point);
            VectorMA(point, -width, pvright, point);
        }
        VectorCopy(point, verts[0].xyz);
        verts[0].st[0] = 0;
        verts[0].st[1] = 0;
        verts[0].modulate[0] = 255;
        verts[0].modulate[1] = 255;
        verts[0].modulate[2] = 255;
        verts[0].modulate[3] = 255;

        if (p->roll) {
            VectorMA(point, 2 * height, ru, point);
        } else {
            VectorMA(point, 2 * height, pvup, point);
        }
        VectorCopy(point, verts[1].xyz);
        verts[1].st[0] = 0;
        verts[1].st[1] = 1;
        verts[1].modulate[0] = 255;
        verts[1].modulate[1] = 255;
        verts[1].modulate[2] = 255;
        verts[1].modulate[3] = 255;

        if (p->roll) {
            VectorMA(point, 2 * width, rr, point);
        } else {
            VectorMA(point, 2 * width, pvright, point);
        }
        VectorCopy(point, verts[2].xyz);
        verts[2].st[0] = 1;
        verts[2].st[1] = 1;
        verts[2].modulate[0] = 255;
        verts[2].modulate[1] = 255;
        verts[2].modulate[2] = 255;
        verts[2].modulate[3] = 255;

        if (p->roll) {
            VectorMA(point, -2 * height, ru, point);
        } else {
            VectorMA(point, -2 * height, pvup, point);
        }
        VectorCopy(point, verts[3].xyz);
        verts[3].st[0] = 1;
        verts[3].st[1] = 0;
        verts[3].modulate[0] = 255;
        verts[3].modulate[1] = 255;
        verts[3].modulate[2] = 255;
        verts[3].modulate[3] = 255;
    } else if (p->type == P_SMOKE || p->type == P_SMOKE_IMPACT) { // create a front rotating facing polygon

        if (p->type == P_SMOKE_IMPACT && Distance(cg.snap->ps.origin, org) > 1024) {
            return;
        }

        if (p->color == BLOODRED)
            VectorSet(color, 0.22f, 0.0f, 0.0f);
        else if (p->color == GREY75) {
            float len;
            float greyit;
            float val;
            len = Distance(cg.snap->ps.origin, org);
            if (!len)
                len = 1;

            val = 4096 / len;
            greyit = 0.25 * val;
            if (greyit > 0.5)
                greyit = 0.5;

            VectorSet(color, greyit, greyit, greyit);
        } else
            VectorSet(color, 1.0, 1.0, 1.0);

        time = cg.time - p->time;
        time2 = p->endtime - p->time;
        ratio = time / time2;

        if (cg.time > p->startfade) {
            invratio = 1 - ((cg.time - p->startfade) / (p->endtime - p->startfade));

            if (p->color == EMISIVEFADE) {
                float fval;
                fval = (invratio * invratio);
                if (fval < 0)
                    fval = 0;
                VectorSet(color, fval, fval, fval);
            }
            invratio *= p->alpha;
        } else
            invratio = 1 * p->alpha;

        if (invratio > 1)
            invratio = 1;

        width = p->width + (ratio * (p->endwidth - p->width));
        height = p->height + (ratio * (p->endheight - p->height));

        if (p->type != P_SMOKE_IMPACT) {
            vec3_t temp;

            vectoangles(rforward, temp);
            p->accumroll += p->roll;
            temp[ROLL] += p->accumroll * 0.1;
            AngleVectors(temp, NULL, rright2, rup2);
        } else {
            VectorCopy(rright, rright2);
            VectorCopy(rup, rup2);
        }

        if (p->rotate) {
            VectorMA(org, -height, rup2, point);
            VectorMA(point, -width, rright2, point);
        } else {
            VectorMA(org, -p->height, pvup, point);
            VectorMA(point, -p->width, pvright, point);
        }
        VectorCopy(point, verts[0].xyz);
        verts[0].st[0] = 0;
        verts[0].st[1] = 0;
        verts[0].modulate[0] = 255 * color[0];
        verts[0].modulate[1] = 255 * color[1];
        verts[0].modulate[2] = 255 * color[2];
        verts[0].modulate[3] = 255 * invratio;

        if (p->rotate) {
            VectorMA(org, -height, rup2, point);
            VectorMA(point, width, rright2, point);
        } else {
            VectorMA(org, -p->height, pvup, point);
            VectorMA(point, p->width, pvright, point);
        }
        VectorCopy(point, verts[1].xyz);
        verts[1].st[0] = 0;
        verts[1].st[1] = 1;
        verts[1].modulate[0] = 255 * color[0];
        verts[1].modulate[1] = 255 * color[1];
        verts[1].modulate[2] = 255 * color[2];
        verts[1].modulate[3] = 255 * invratio;

        if (p->rotate) {
            VectorMA(org, height, rup2, point);
            VectorMA(point, width, rright2, point);
        } else {
            VectorMA(org, p->height, pvup, point);
            VectorMA(point, p->width, pvright, point);
        }
        VectorCopy(point, verts[2].xyz);
        verts[2].st[0] = 1;
        verts[2].st[1] = 1;
        verts[2].modulate[0] = 255 * color[0];
        verts[2].modulate[1] = 255 * color[1];
        verts[2].modulate[2] = 255 * color[2];
        verts[2].modulate[3] = 255 * invratio;

        if (p->rotate) {
            VectorMA(org, height, rup2, point);
            VectorMA(point, -width, rright2, point);
        } else {
            VectorMA(org, p->height, pvup, point);
            VectorMA(point, -p->width, pvright, point);
        }
        VectorCopy(point, verts[3].xyz);
        verts[3].st[0] = 1;
        verts[3].st[1] = 0;
        verts[3].modulate[0] = 255 * color[0];
        verts[3].modulate[1] = 255 * color[1];
        verts[3].modulate[2] = 255 * color[2];
        verts[3].modulate[3] = 255 * invratio;

    } else if (p->type == P_BLEED) {
        vec3_t rr, ru;
        vec3_t rotate_ang;
        float alpha;

        alpha = p->alpha;

        if (p->roll) {
            vectoangles(cg.refdef.viewaxis[0], rotate_ang);
            rotate_ang[ROLL] += p->roll;
            AngleVectors(rotate_ang, NULL, rr, ru);
        } else {
            VectorCopy(pvup, ru);
            VectorCopy(pvright, rr);
        }

        VectorMA(org, -p->height, ru, point);
        VectorMA(point, -p->width, rr, point);
        VectorCopy(point, verts[0].xyz);
        verts[0].st[0] = 0;
        verts[0].st[1] = 0;
        verts[0].modulate[0] = 111;
        verts[0].modulate[1] = 19;
        verts[0].modulate[2] = 9;
        verts[0].modulate[3] = 255 * alpha;

        VectorMA(org, -p->height, ru, point);
        VectorMA(point, p->width, rr, point);
        VectorCopy(point, verts[1].xyz);
        verts[1].st[0] = 0;
        verts[1].st[1] = 1;
        verts[1].modulate[0] = 111;
        verts[1].modulate[1] = 19;
        verts[1].modulate[2] = 9;
        verts[1].modulate[3] = 255 * alpha;

        VectorMA(org, p->height, ru, point);
        VectorMA(point, p->width, rr, point);
        VectorCopy(point, verts[2].xyz);
        verts[2].st[0] = 1;
        verts[2].st[1] = 1;
        verts[2].modulate[0] = 111;
        verts[2].modulate[1] = 19;
        verts[2].modulate[2] = 9;
        verts[2].modulate[3] = 255 * alpha;

        VectorMA(org, p->height, ru, point);
        VectorMA(point, -p->width, rr, point);
        VectorCopy(point, verts[3].xyz);
        verts[3].st[0] = 1;
        verts[3].st[1] = 0;
        verts[3].modulate[0] = 111;
        verts[3].modulate[1] = 19;
        verts[3].modulate[2] = 9;
        verts[3].modulate[3] = 255 * alpha;

    } else if (p->type == P_FLAT_SCALEUP) {
        float width, height;
        float sinR, cosR;

        if (p->color == BLOODRED)
            VectorSet(color, 1, 1, 1);
        else
            VectorSet(color, 0.5, 0.5, 0.5);

        time = cg.time - p->time;
        time2 = p->endtime - p->time;
        ratio = time / time2;

        width = p->width + (ratio * (p->endwidth - p->width));
        height = p->height + (ratio * (p->endheight - p->height));

        if (width > p->endwidth)
            width = p->endwidth;

        if (height > p->endheight)
            height = p->endheight;

        sinR = height * sin(DEG2RAD(p->roll)) * sqrt(2);
        cosR = width * cos(DEG2RAD(p->roll)) * sqrt(2);

        VectorCopy(org, verts[0].xyz);
        verts[0].xyz[0] -= sinR;
        verts[0].xyz[1] -= cosR;
        verts[0].st[0] = 0;
        verts[0].st[1] = 0;
        verts[0].modulate[0] = 255 * color[0];
        verts[0].modulate[1] = 255 * color[1];
        verts[0].modulate[2] = 255 * color[2];
        verts[0].modulate[3] = 255;

        VectorCopy(org, verts[1].xyz);
        verts[1].xyz[0] -= cosR;
        verts[1].xyz[1] += sinR;
        verts[1].st[0] = 0;
        verts[1].st[1] = 1;
        verts[1].modulate[0] = 255 * color[0];
        verts[1].modulate[1] = 255 * color[1];
        verts[1].modulate[2] = 255 * color[2];
        verts[1].modulate[3] = 255;

        VectorCopy(org, verts[2].xyz);
        verts[2].xyz[0] += sinR;
        verts[2].xyz[1] += cosR;
        verts[2].st[0] = 1;
        verts[2].st[1] = 1;
        verts[2].modulate[0] = 255 * color[0];
        verts[2].modulate[1] = 255 * color[1];
        verts[2].modulate[2] = 255 * color[2];
        verts[2].modulate[3] = 255;

        VectorCopy(org, verts[3].xyz);
        verts[3].xyz[0] += cosR;
        verts[3].xyz[1] -= sinR;
        verts[3].st[0] = 1;
        verts[3].st[1] = 0;
        verts[3].modulate[0] = 255 * color[0];
        verts[3].modulate[1] = 255 * color[1];
        verts[3].modulate[2] = 255 * color[2];
        verts[3].modulate[3] = 255;
    } else if (p->type == P_FLAT) {

        VectorCopy(org, verts[0].xyz);
        verts[0].xyz[0] -= p->height;
        verts[0].xyz[1] -= p->width;
        verts[0].st[0] = 0;
        verts[0].st[1] = 0;
        verts[0].modulate[0] = 255;
        verts[0].modulate[1] = 255;
        verts[0].modulate[2] = 255;
        verts[0].modulate[3] = 255;

        VectorCopy(org, verts[1].xyz);
        verts[1].xyz[0] -= p->height;
        verts[1].xyz[1] += p->width;
        verts[1].st[0] = 0;
        verts[1].st[1] = 1;
        verts[1].modulate[0] = 255;
        verts[1].modulate[1] = 255;
        verts[1].modulate[2] = 255;
        verts[1].modulate[3] = 255;

        VectorCopy(org, verts[2].xyz);
        verts[2].xyz[0] += p->height;
        verts[2].xyz[1] += p->width;
        verts[2].st[0] = 1;
        verts[2].st[1] = 1;
        verts[2].modulate[0] = 255;
        verts[2].modulate[1] = 255;
        verts[2].modulate[2] = 255;
        verts[2].modulate[3] = 255;

        VectorCopy(org, verts[3].xyz);
        verts[3].xyz[0] += p->height;
        verts[3].xyz[1] -= p->width;
        verts[3].st[0] = 1;
        verts[3].st[1] = 0;
        verts[3].modulate[0] = 255;
        verts[3].modulate[1] = 255;
        verts[3].modulate[2] = 255;
        verts[3].modulate[3] = 255;

    }
    // Ridah
    else if (p->type == P_ANIM) {
        vec3_t rr, ru;
        vec3_t rotate_ang;
        int i, j;

        time = cg.time - p->time;
        time2 = p->endtime - p->time;
        ratio = time / time2;
        if (ratio >= 1.0f) {
            ratio = 0.9999f;
        }

        width = p->width + (ratio * (p->endwidth - p->width));
        height = p->height + (ratio * (p->endheight - p->height));

        // if we are "inside" this sprite, don't draw
        if (Distance(cg.snap->ps.origin, org) < width / 1.5) {
            return;
        }

        i = p->shaderAnim;
        j = (int)floor(ratio * shaderAnimCounts[p->shaderAnim]);
        p->pshader = shaderAnims[i][j];

        if (p->roll) {
            vectoangles(cg.refdef.viewaxis[0], rotate_ang);
            rotate_ang[ROLL] += p->roll;
            AngleVectors(rotate_ang, NULL, rr, ru);
        }

        if (p->roll) {
            VectorMA(org, -height, ru, point);
            VectorMA(point, -width, rr, point);
        } else {
            VectorMA(org, -height, pvup, point);
            VectorMA(point, -width, pvright, point);
        }
        VectorCopy(point, verts[0].xyz);
        verts[0].st[0] = 0;
        verts[0].st[1] = 0;
        verts[0].modulate[0] = 255;
        verts[0].modulate[1] = 255;
        verts[0].modulate[2] = 255;
        verts[0].modulate[3] = 255;

        if (p->roll) {
            VectorMA(point, 2 * height, ru, point);
        } else {
            VectorMA(point, 2 * height, pvup, point);
        }
        VectorCopy(point, verts[1].xyz);
        verts[1].st[0] = 0;
        verts[1].st[1] = 1;
        verts[1].modulate[0] = 255;
        verts[1].modulate[1] = 255;
        verts[1].modulate[2] = 255;
        verts[1].modulate[3] = 255;

        if (p->roll) {
            VectorMA(point, 2 * width, rr, point);
        } else {
            VectorMA(point, 2 * width, pvright, point);
        }
        VectorCopy(point, verts[2].xyz);
        verts[2].st[0] = 1;
        verts[2].st[1] = 1;
        verts[2].modulate[0] = 255;
        verts[2].modulate[1] = 255;
        verts[2].modulate[2] = 255;
        verts[2].modulate[3] = 255;

        if (p->roll) {
            VectorMA(point, -2 * height, ru, point);
        } else {
            VectorMA(point, -2 * height, pvup, point);
        }
        VectorCopy(point, verts[3].xyz);
        verts[3].st[0] = 1;
        verts[3].st[1] = 0;
        verts[3].modulate[0] = 255;
        verts[3].modulate[1] = 255;
        verts[3].modulate[2] = 255;
        verts[3].modulate[3] = 255;
    }
    // done.

    if (!p->pshader) {
        // (SA) temp commented out for DM
        //		CG_Printf ("CG_AddParticleToScene type %d p->pshader == ZERO\n", p->type);
        return;
    }

    if (p->type == P_WEATHER || p->type == P_WEATHER_TURBULENT || p->type == P_WEATHER_FLURRY)
        trap_R_AddPolyToScene(p->pshader, 3, TRIverts);
    else
        trap_R_AddPolyToScene(p->pshader, 4, verts);
}

// Ridah, made this static so it doesn't interfere with other files
static float roll = 0.0;

void CG_AddParticles()
{
    cparticle_t *p, *next;
    float alpha;
    float time, time2;
    vec3_t org;
    cparticle_t *active, *tail;
    vec3_t rotate_ang;

    if (!initparticles)
        CG_ClearParticles();

    VectorCopy(cg.refdef.viewaxis[0], pvforward);
    VectorCopy(cg.refdef.viewaxis[1], pvright);
    VectorCopy(cg.refdef.viewaxis[2], pvup);

    vectoangles(cg.refdef.viewaxis[0], rotate_ang);
    roll += ((cg.time - oldtime) * 0.1);
    rotate_ang[ROLL] += (roll * 0.9);
    AngleVectors(rotate_ang, rforward, rright, rup);

    oldtime = cg.time;

    active = NULL;
    tail = NULL;

    for (p = active_particles; p; p = next) {

        next = p->next;

        time = (cg.time - p->time) * 0.001;

        alpha = p->alpha + time * p->alphavel;
        if (alpha <= 0) { // faded out
            p->next = free_particles;
            free_particles = p;
            p->type = 0;
            p->color = 0;
            p->alpha = 0;
            continue;
        }

        if (p->type == P_SMOKE || p->type == P_ANIM || p->type == P_BLEED || p->type == P_SMOKE_IMPACT) {
            if (cg.time > p->endtime) {
                p->next = free_particles;
                free_particles = p;
                p->type = 0;
                p->color = 0;
                p->alpha = 0;

                continue;
            }
        }

        if (p->type == P_WEATHER_FLURRY) {
            if (cg.time > p->endtime) {
                p->next = free_particles;
                free_particles = p;
                p->type = 0;
                p->color = 0;
                p->alpha = 0;

                continue;
            }
        }

        if (p->type == P_FLAT_SCALEUP_FADE) {
            if (cg.time > p->endtime) {
                p->next = free_particles;
                free_particles = p;
                p->type = 0;
                p->color = 0;
                p->alpha = 0;
                continue;
            }
        }

        if ((p->type == P_BAT || p->type == P_SPRITE) && p->endtime < 0) {
            // temporary sprite
            CG_AddParticleToScene(p, p->org, alpha);
            p->next = free_particles;
            free_particles = p;
            p->type = 0;
            p->color = 0;
            p->alpha = 0;
            continue;
        }

        p->next = NULL;
        if (!tail)
            active = tail = p;
        else {
            tail->next = p;
            tail = p;
        }

        if (alpha > 1.0)
            alpha = 1;

        time2 = time * time;

        org[0] = p->org[0] + p->vel[0] * time + p->accel[0] * time2;
        org[1] = p->org[1] + p->vel[1] * time + p->accel[1] * time2;
        org[2] = p->org[2] + p->vel[2] * time + p->accel[2] * time2;

        CG_AddParticleToScene(p, org, alpha);
    }

    active_particles = active;
}

void CG_ParticleExplosion(char* animStr, vec3_t origin, vec3_t vel, int duration, int sizeStart, int sizeEnd)
{
    cparticle_t* p;
    int anim;

    if (animStr < (char*)10)
        CG_Error("CG_ParticleExplosion: animStr is probably an index rather than a string");

    // find the animation string
    for (anim = 0; shaderAnimNames[anim]; anim++) {
        if (!Q_stricmp(animStr, shaderAnimNames[anim]))
            break;
    }
    if (!shaderAnimNames[anim]) {
        CG_Error("CG_ParticleExplosion: unknown animation string: %s\n", animStr);
        return;
    }

    if (!free_particles)
        return;
    p = free_particles;
    free_particles = p->next;
    p->next = active_particles;
    active_particles = p;
    p->time = cg.time;
    p->alpha = 0.5;
    p->alphavel = 0;

    if (duration < 0) {
        duration *= -1;
        p->roll = 0;
    } else {
        p->roll = crandom() * 179;
    }

    p->shaderAnim = anim;

    p->width = sizeStart;
    p->height = sizeStart * shaderAnimSTRatio[anim]; // for sprites that are stretch in either direction

    p->endheight = sizeEnd;
    p->endwidth = sizeEnd * shaderAnimSTRatio[anim];

    p->endtime = cg.time + duration;

    p->type = P_ANIM;

    VectorCopy(origin, p->org);
    VectorCopy(vel, p->vel);
    VectorClear(p->accel);
}
