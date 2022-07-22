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
// tr_flares.c

#include "tr_local.h"

/*
=============================================================================

LIGHT FLARES

A light flare is an effect that takes place inside the eye when bright light
sources are visible.  The size of the flare relative to the screen is nearly
constant, irrespective of distance, but the intensity should be proportional to the
projected area of the light source.

A surface that has been flagged as having a light flare will calculate the depth
buffer value that its midpoint should have when the surface is added.

After all opaque surfaces have been rendered, the depth buffer is read back for
each flare in view.  If the point has not been obscured by a closer surface, the
flare should be drawn.

Surfaces that have a repeated texture should never be flagged as flaring, because
there will only be a single flare added at the midpoint of the polygon.

To prevent abrupt popping, the intensity of the flare is interpolated up and
down as it changes visibility.  This involves scene to scene state, unlike almost
all other aspects of the renderer, and is complicated by the fact that a single
frame may have multiple scenes.

RB_RenderFlares() will be called once per view (twice in a mirrored scene, potentially
up to five or more times in a frame with 3D status bar icons).

=============================================================================
*/

// flare states maintain visibility over multiple frames for fading
// layers: view, mirror, menu
typedef struct flare_s {
    struct flare_s* next; // for active chain

    int addedFrame;

    bool inPortal; // true if in a portal view of the scene
    int frameSceneNum;
    void* surface;
    int fogNum;

    int fadeTime;

    bool visible; // state of last test
    float drawIntensity; // may be non 0 even if !visible due to fading

    int windowX, windowY;
    float eyeZ;

    vec3_t color;
} flare_t;

#define MAX_FLARES 128

static flare_t r_flareStructs[MAX_FLARES];
static flare_t* r_activeFlares;
static flare_t* r_inactiveFlares;

void R_ClearFlares(void)
{
    int i;

    memset(r_flareStructs, 0, sizeof(r_flareStructs));
    r_activeFlares = NULL;
    r_inactiveFlares = NULL;

    for (i = 0; i < MAX_FLARES; i++) {
        r_flareStructs[i].next = r_inactiveFlares;
        r_inactiveFlares = &r_flareStructs[i];
    }
}

/*
===============================================================================

FLARE BACK END

===============================================================================
*/

static void RB_TestFlare(flare_t* f)
{
    float depth;
    bool visible;
    float fade;
    float screenZ;

    backEnd.pc.c_flareTests++;

    // doing a readpixels is as good as doing a glFinish(), so
    // don't bother with another sync
    glState.finishCalled = false;

    // read back the z buffer contents
    qglReadPixels(f->windowX, f->windowY, 1, 1, GL_DEPTH_COMPONENT, GL_FLOAT, &depth);

    screenZ = backEnd.viewParms.projectionMatrix[14] / ((2 * depth - 1) * backEnd.viewParms.projectionMatrix[11] - backEnd.viewParms.projectionMatrix[10]);

    visible = (-f->eyeZ - -screenZ) < 24;

    if (visible) {
        if (!f->visible) {
            f->visible = true;
            f->fadeTime = backEnd.refdef.time - 1;
        }
        fade = ((backEnd.refdef.time - f->fadeTime) / 1000.0f) * r_flareFade->value;
    } else {
        if (f->visible) {
            f->visible = false;
            f->fadeTime = backEnd.refdef.time - 1;
        }
        fade = 1.0f - ((backEnd.refdef.time - f->fadeTime) / 1000.0f) * r_flareFade->value;
    }

    if (fade < 0) {
        fade = 0;
    }
    if (fade > 1) {
        fade = 1;
    }

    f->drawIntensity = fade;
}

static void RB_RenderFlare(flare_t* f)
{
    float size;
    vec3_t color;
    int iColor[3];

    backEnd.pc.c_flareRenders++;

    VectorScale(f->color, f->drawIntensity * tr.identityLight, color);
    iColor[0] = color[0] * 255;
    iColor[1] = color[1] * 255;
    iColor[2] = color[2] * 255;

    size = backEnd.viewParms.viewportWidth * (r_flareSize->value / 640.0f + 8 / -f->eyeZ);

    RB_BeginSurface(tr.flareShader, f->fogNum);

    // FIXME: use quadstamp?
    tess.xyz[tess.numVertexes][0] = f->windowX - size;
    tess.xyz[tess.numVertexes][1] = f->windowY - size;
    tess.texCoords[tess.numVertexes][0][0] = 0;
    tess.texCoords[tess.numVertexes][0][1] = 0;
    tess.vertexColors[tess.numVertexes][0] = iColor[0];
    tess.vertexColors[tess.numVertexes][1] = iColor[1];
    tess.vertexColors[tess.numVertexes][2] = iColor[2];
    tess.vertexColors[tess.numVertexes][3] = 255;
    tess.numVertexes++;

    tess.xyz[tess.numVertexes][0] = f->windowX - size;
    tess.xyz[tess.numVertexes][1] = f->windowY + size;
    tess.texCoords[tess.numVertexes][0][0] = 0;
    tess.texCoords[tess.numVertexes][0][1] = 1;
    tess.vertexColors[tess.numVertexes][0] = iColor[0];
    tess.vertexColors[tess.numVertexes][1] = iColor[1];
    tess.vertexColors[tess.numVertexes][2] = iColor[2];
    tess.vertexColors[tess.numVertexes][3] = 255;
    tess.numVertexes++;

    tess.xyz[tess.numVertexes][0] = f->windowX + size;
    tess.xyz[tess.numVertexes][1] = f->windowY + size;
    tess.texCoords[tess.numVertexes][0][0] = 1;
    tess.texCoords[tess.numVertexes][0][1] = 1;
    tess.vertexColors[tess.numVertexes][0] = iColor[0];
    tess.vertexColors[tess.numVertexes][1] = iColor[1];
    tess.vertexColors[tess.numVertexes][2] = iColor[2];
    tess.vertexColors[tess.numVertexes][3] = 255;
    tess.numVertexes++;

    tess.xyz[tess.numVertexes][0] = f->windowX + size;
    tess.xyz[tess.numVertexes][1] = f->windowY - size;
    tess.texCoords[tess.numVertexes][0][0] = 1;
    tess.texCoords[tess.numVertexes][0][1] = 0;
    tess.vertexColors[tess.numVertexes][0] = iColor[0];
    tess.vertexColors[tess.numVertexes][1] = iColor[1];
    tess.vertexColors[tess.numVertexes][2] = iColor[2];
    tess.vertexColors[tess.numVertexes][3] = 255;
    tess.numVertexes++;

    tess.indexes[tess.numIndexes++] = 0;
    tess.indexes[tess.numIndexes++] = 1;
    tess.indexes[tess.numIndexes++] = 2;
    tess.indexes[tess.numIndexes++] = 0;
    tess.indexes[tess.numIndexes++] = 2;
    tess.indexes[tess.numIndexes++] = 3;

    RB_EndSurface();
}

/*
==================
RB_RenderFlares

Because flares are simulating an occular effect, they should be drawn after
everything (all views) in the entire frame has been drawn.

Because of the way portals use the depth buffer to mark off areas, the
needed information would be lost after each view, so we are forced to draw
flares after each view.

The resulting artifact is that flares in mirrors or portals don't dim properly
when occluded by something in the main view, and portal flares that should
extend past the portal edge will be overwritten.
==================
*/
void RB_RenderFlares(void)
{
    flare_t* f;
    flare_t** prev;
    bool draw;

    if (!r_flares->integer) {
        return;
    }

    // perform z buffer readback on each flare in this view
    draw = false;
    prev = &r_activeFlares;
    while ((f = *prev) != NULL) {
        // throw out any flares that weren't added last frame
        if (f->addedFrame < backEnd.viewParms.frameCount - 1) {
            *prev = f->next;
            f->next = r_inactiveFlares;
            r_inactiveFlares = f;
            continue;
        }

        // don't draw any here that aren't from this scene / portal
        f->drawIntensity = 0;
        if (f->frameSceneNum == backEnd.viewParms.frameSceneNum
            && f->inPortal == backEnd.viewParms.isPortal) {
            RB_TestFlare(f);
            if (f->drawIntensity) {
                draw = true;
            } else {
                // this flare has completely faded out, so remove it from the chain
                *prev = f->next;
                f->next = r_inactiveFlares;
                r_inactiveFlares = f;
                continue;
            }
        }

        prev = &f->next;
    }

    if (!draw) {
        return; // none visible
    }

    if (backEnd.viewParms.isPortal) {
        qglDisable(GL_CLIP_PLANE0);
    }

    qglPushMatrix();
    qglLoadIdentity();
    qglMatrixMode(GL_PROJECTION);
    qglPushMatrix();
    qglLoadIdentity();
    qglOrtho(backEnd.viewParms.viewportX, backEnd.viewParms.viewportX + backEnd.viewParms.viewportWidth,
             backEnd.viewParms.viewportY, backEnd.viewParms.viewportY + backEnd.viewParms.viewportHeight,
             -99999, 99999);

    for (f = r_activeFlares; f; f = f->next) {
        if (f->frameSceneNum == backEnd.viewParms.frameSceneNum
            && f->inPortal == backEnd.viewParms.isPortal
            && f->drawIntensity) {
            RB_RenderFlare(f);
        }
    }

    qglPopMatrix();
    qglMatrixMode(GL_MODELVIEW);
    qglPopMatrix();
}
