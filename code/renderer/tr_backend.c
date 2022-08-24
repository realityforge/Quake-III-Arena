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
#include "tr_local.h"
#include "tr_fbo.h"
#include "tr_dsa.h"

backEndData_t* backEndData;
backEndState_t backEnd;

static float s_flipMatrix[16] = {
    // convert from our coordinate system (looking down X)
    // to OpenGL's coordinate system (looking down -Z)
    0, 0, -1, 0,
    -1, 0, 0, 0,
    0, 1, 0, 0,
    0, 0, 0, 1
};

void GL_BindToTMU(image_t* image, int tmu)
{
    GLuint texture = (tmu == TB_COLORMAP) ? tr.defaultImage->texnum : 0;
    GLenum target = GL_TEXTURE_2D;

    if (image) {
        if (image->flags & IMGFLAG_CUBEMAP)
            target = GL_TEXTURE_CUBE_MAP;

        image->frameUsed = tr.frameCount;
        texture = image->texnum;
    } else {
        ri.Printf(PRINT_WARNING, "GL_BindToTMU: NULL image\n");
    }

    GL_BindMultiTexture(GL_TEXTURE0 + tmu, target, texture);
}

void GL_Cull(int cullType)
{
    if (glState.faceCulling == cullType) {
        return;
    }

    if (cullType == CT_TWO_SIDED) {
        glDisable(GL_CULL_FACE);
    } else {
        bool cullFront = (cullType == CT_FRONT_SIDED);

        if (glState.faceCulling == CT_TWO_SIDED)
            glEnable(GL_CULL_FACE);

        if (glState.faceCullFront != cullFront)
            glCullFace(cullFront ? GL_FRONT : GL_BACK);

        glState.faceCullFront = cullFront;
    }

    glState.faceCulling = cullType;
}

/*
** GL_State
**
** This routine is responsible for setting the most commonly changed state
** in Q3.
*/
void GL_State(unsigned long stateBits)
{
    unsigned long diff = stateBits ^ glState.glStateBits;

    if (!diff) {
        return;
    }

    // check depthFunc bits
    if (diff & GLS_DEPTHFUNC_BITS) {
        if (stateBits & GLS_DEPTHFUNC_EQUAL) {
            glDepthFunc(GL_EQUAL);
        } else if (stateBits & GLS_DEPTHFUNC_GREATER) {
            glDepthFunc(GL_GREATER);
        } else {
            glDepthFunc(GL_LEQUAL);
        }
    }

    // check blend bits
    if (diff & (GLS_SRCBLEND_BITS | GLS_DSTBLEND_BITS)) {
        uint32_t oldState = glState.glStateBits & (GLS_SRCBLEND_BITS | GLS_DSTBLEND_BITS);
        uint32_t newState = stateBits & (GLS_SRCBLEND_BITS | GLS_DSTBLEND_BITS);
        uint32_t storedState = glState.storedGlState & (GLS_SRCBLEND_BITS | GLS_DSTBLEND_BITS);

        if (oldState == 0) {
            glEnable(GL_BLEND);
        } else if (newState == 0) {
            glDisable(GL_BLEND);
        }

        if (newState != 0 && storedState != newState) {
            GLenum srcFactor = GL_ONE, dstFactor = GL_ONE;

            glState.storedGlState &= ~(GLS_SRCBLEND_BITS | GLS_DSTBLEND_BITS);
            glState.storedGlState |= newState;

            switch (stateBits & GLS_SRCBLEND_BITS) {
            case GLS_SRCBLEND_ZERO:
                srcFactor = GL_ZERO;
                break;
            case GLS_SRCBLEND_ONE:
                srcFactor = GL_ONE;
                break;
            case GLS_SRCBLEND_DST_COLOR:
                srcFactor = GL_DST_COLOR;
                break;
            case GLS_SRCBLEND_ONE_MINUS_DST_COLOR:
                srcFactor = GL_ONE_MINUS_DST_COLOR;
                break;
            case GLS_SRCBLEND_SRC_ALPHA:
                srcFactor = GL_SRC_ALPHA;
                break;
            case GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA:
                srcFactor = GL_ONE_MINUS_SRC_ALPHA;
                break;
            case GLS_SRCBLEND_DST_ALPHA:
                srcFactor = GL_DST_ALPHA;
                break;
            case GLS_SRCBLEND_ONE_MINUS_DST_ALPHA:
                srcFactor = GL_ONE_MINUS_DST_ALPHA;
                break;
            case GLS_SRCBLEND_ALPHA_SATURATE:
                srcFactor = GL_SRC_ALPHA_SATURATE;
                break;
            default:
                ri.Error(ERR_DROP, "GL_State: invalid src blend state bits");
            }

            switch (stateBits & GLS_DSTBLEND_BITS) {
            case GLS_DSTBLEND_ZERO:
                dstFactor = GL_ZERO;
                break;
            case GLS_DSTBLEND_ONE:
                dstFactor = GL_ONE;
                break;
            case GLS_DSTBLEND_SRC_COLOR:
                dstFactor = GL_SRC_COLOR;
                break;
            case GLS_DSTBLEND_ONE_MINUS_SRC_COLOR:
                dstFactor = GL_ONE_MINUS_SRC_COLOR;
                break;
            case GLS_DSTBLEND_SRC_ALPHA:
                dstFactor = GL_SRC_ALPHA;
                break;
            case GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA:
                dstFactor = GL_ONE_MINUS_SRC_ALPHA;
                break;
            case GLS_DSTBLEND_DST_ALPHA:
                dstFactor = GL_DST_ALPHA;
                break;
            case GLS_DSTBLEND_ONE_MINUS_DST_ALPHA:
                dstFactor = GL_ONE_MINUS_DST_ALPHA;
                break;
            default:
                ri.Error(ERR_DROP, "GL_State: invalid dst blend state bits");
            }

            glBlendFunc(srcFactor, dstFactor);
        }
    }

    // check depthmask
    if (diff & GLS_DEPTHMASK_TRUE) {
        if (stateBits & GLS_DEPTHMASK_TRUE) {
            glDepthMask(GL_TRUE);
        } else {
            glDepthMask(GL_FALSE);
        }
    }

    // fill/line mode
    if (diff & GLS_POLYMODE_LINE) {
        if (stateBits & GLS_POLYMODE_LINE) {
            glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
        } else {
            glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
        }
    }

    // depthtest
    if (diff & GLS_DEPTHTEST_DISABLE) {
        if (stateBits & GLS_DEPTHTEST_DISABLE) {
            glDisable(GL_DEPTH_TEST);
        } else {
            glEnable(GL_DEPTH_TEST);
        }
    }

    glState.glStateBits = stateBits;
}

void GL_SetProjectionMatrix(mat4_t matrix)
{
    Mat4Copy(matrix, glState.projection);
    Mat4Multiply(glState.projection, glState.modelview, glState.modelviewProjection);
}

void GL_SetModelviewMatrix(mat4_t matrix)
{
    Mat4Copy(matrix, glState.modelview);
    Mat4Multiply(glState.projection, glState.modelview, glState.modelviewProjection);
}

/*
================
RB_Hyperspace

A player has predicted a teleport, but hasn't arrived yet
================
*/
static void RB_Hyperspace()
{
    float c;

    if (!backEnd.isHyperspace) {
        // do initialization shit
    }

    c = (backEnd.refdef.time & 255) / 255.0f;
    glClearColor(c, c, c, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);

    backEnd.isHyperspace = true;
}

static void SetViewportAndScissor()
{
    GL_SetProjectionMatrix(backEnd.viewParms.projectionMatrix);

    // set the window clipping
    glViewport(backEnd.viewParms.viewportX, backEnd.viewParms.viewportY,
               backEnd.viewParms.viewportWidth, backEnd.viewParms.viewportHeight);
    glScissor(backEnd.viewParms.viewportX, backEnd.viewParms.viewportY,
              backEnd.viewParms.viewportWidth, backEnd.viewParms.viewportHeight);
}

/*
=================
RB_BeginDrawingView

Any mirrored or portaled views have already been drawn, so prepare
to actually render the visible surfaces for this view
=================
*/
static void RB_BeginDrawingView()
{
    int clearBits = 0;

    // sync with gl if needed
    if (r_finish->integer == 1 && !glState.finishCalled) {
        glFinish();
        glState.finishCalled = true;
    }
    if (r_finish->integer == 0) {
        glState.finishCalled = true;
    }

    // we will need to change the projection matrix before drawing
    // 2D images again
    backEnd.projection2D = false;

    if (glConfig.framebufferObject) {
        FBO_t* fbo = backEnd.viewParms.targetFbo;

        // FIXME: HUGE HACK: render to the screen fbo if we've already postprocessed the frame and aren't drawing more world
        // drawing more world check is in case of double renders, such as skyportals
        if (fbo == NULL && !(backEnd.framePostProcessed && (backEnd.refdef.rdflags & RDF_NOWORLDMODEL)))
            fbo = tr.renderFbo;

        FBO_Bind(fbo);
    }

    // set the modelview matrix for the viewer
    SetViewportAndScissor();

    // ensures that depth writes are enabled for the depth clear
    GL_State(GLS_DEFAULT);
    // clear relevant buffers
    clearBits = GL_DEPTH_BUFFER_BIT;

    if (r_measureOverdraw->integer || r_shadows->integer == 2) {
        clearBits |= GL_STENCIL_BUFFER_BIT;
    }
    if (r_fastsky->integer && !(backEnd.refdef.rdflags & RDF_NOWORLDMODEL)) {
        clearBits |= GL_COLOR_BUFFER_BIT; // FIXME: only if sky shaders have been used
    }

    glClear(clearBits);

    if ((backEnd.refdef.rdflags & RDF_HYPERSPACE)) {
        RB_Hyperspace();
        return;
    } else {
        backEnd.isHyperspace = false;
    }

    // we will only draw a sun if there was sky rendered in this view
    backEnd.skyRenderedThisView = false;

    // clip to the plane of the portal
    if (backEnd.viewParms.isPortal) {
        GL_SetModelviewMatrix(s_flipMatrix);
    }
}

static void RB_RenderDrawSurfList(drawSurf_t* drawSurfs, int numDrawSurfs)
{
    shader_t *shader = NULL, *oldShader;
    int fogNum, oldFogNum;
    int entityNum, oldEntityNum;
    int dlighted, oldDlighted;
    int pshadowed, oldPshadowed;
    bool depthRange, oldDepthRange, isCrosshair, wasCrosshair;
    int i;
    drawSurf_t* drawSurf;
    int oldSort;
    double originalTime;
    FBO_t* fbo = NULL;

    // save original time for entity shader offsets
    originalTime = backEnd.refdef.floatTime;

    fbo = glState.currentFBO;

    // draw everything
    oldEntityNum = -1;
    backEnd.currentEntity = &tr.worldEntity;
    oldShader = NULL;
    oldFogNum = -1;
    oldDepthRange = false;
    wasCrosshair = false;
    oldDlighted = false;
    oldPshadowed = false;
    oldSort = -1;

    backEnd.pc.c_surfaces += numDrawSurfs;

    for (i = 0, drawSurf = drawSurfs; i < numDrawSurfs; i++, drawSurf++) {
        if (drawSurf->sort == oldSort) {
            if (backEnd.depthFill && shader && shader->sort != SS_OPAQUE)
                continue;

            // fast path, same as previous sort
            rb_surfaceTable[*drawSurf->surface](drawSurf->surface);
            continue;
        }
        oldSort = drawSurf->sort;
        R_DecomposeSort(drawSurf->sort, &entityNum, &shader, &fogNum, &dlighted, &pshadowed);

        // change the tess parameters if needed
        // a "entityMergable" shader is a shader that can have surfaces from separate
        // entities merged into a single batch, like smoke and blood puff sprites
        if (shader != NULL && (shader != oldShader || fogNum != oldFogNum || dlighted != oldDlighted || pshadowed != oldPshadowed || (entityNum != oldEntityNum && !shader->entityMergable))) {
            if (oldShader != NULL) {
                RB_EndSurface();
            }
            RB_BeginSurface(shader, fogNum);
            backEnd.pc.c_surfBatches++;
            oldShader = shader;
            oldFogNum = fogNum;
            oldDlighted = dlighted;
            oldPshadowed = pshadowed;
        }

        if (backEnd.depthFill && shader && shader->sort != SS_OPAQUE)
            continue;

        // change the modelview matrix if needed
        if (entityNum != oldEntityNum) {
            depthRange = isCrosshair = false;

            if (entityNum != REFENTITYNUM_WORLD) {
                backEnd.currentEntity = &backEnd.refdef.entities[entityNum];

                // FIXME: e.shaderTime must be passed as int to avoid fp-precision loss issues
                backEnd.refdef.floatTime = originalTime - (double)backEnd.currentEntity->e.shaderTime;

                // we have to reset the shaderTime as well otherwise image animations start
                // from the wrong frame
                tess.shaderTime = backEnd.refdef.floatTime - tess.shader->timeOffset;

                // set up the transformation matrix
                R_RotateForEntity(backEnd.currentEntity, &backEnd.viewParms, &backEnd.or);

                // set up the dynamic lighting if needed
                if (backEnd.currentEntity->needDlights) {
                    R_TransformDlights(backEnd.refdef.num_dlights, backEnd.refdef.dlights, &backEnd.or);
                }

                if (backEnd.currentEntity->e.renderfx & RF_DEPTHHACK) {
                    // hack the depth range to prevent view model from poking into walls
                    depthRange = true;

                    if (backEnd.currentEntity->e.renderfx & RF_CROSSHAIR)
                        isCrosshair = true;
                }
            } else {
                backEnd.currentEntity = &tr.worldEntity;
                backEnd.refdef.floatTime = originalTime;
                backEnd.or = backEnd.viewParms.world;
                // we have to reset the shaderTime as well otherwise image animations on
                // the world (like water) continue with the wrong frame
                tess.shaderTime = backEnd.refdef.floatTime - tess.shader->timeOffset;
                R_TransformDlights(backEnd.refdef.num_dlights, backEnd.refdef.dlights, &backEnd.or);
            }

            GL_SetModelviewMatrix(backEnd.or.modelMatrix);

            // change depthrange. Also change projection matrix so first person weapon does not look like coming
            // out of the screen.
            if (oldDepthRange != depthRange || wasCrosshair != isCrosshair) {
                if (depthRange) {
                    if (backEnd.viewParms.stereoFrame != STEREO_CENTER) {
                        if (isCrosshair) {
                            if (oldDepthRange) {
                                // was not a crosshair but now is, change back proj matrix
                                GL_SetProjectionMatrix(backEnd.viewParms.projectionMatrix);
                            }
                        } else {
                            viewParms_t temp = backEnd.viewParms;

                            R_SetupProjection(&temp, r_znear->value, 0, false);

                            GL_SetProjectionMatrix(temp.projectionMatrix);
                        }
                    }

                    if (!oldDepthRange)
                        glDepthRange(0, 0.3);
                } else {
                    if (!wasCrosshair && backEnd.viewParms.stereoFrame != STEREO_CENTER) {
                        GL_SetProjectionMatrix(backEnd.viewParms.projectionMatrix);
                    }

                    glDepthRange(0, 1);
                }

                oldDepthRange = depthRange;
                wasCrosshair = isCrosshair;
            }

            oldEntityNum = entityNum;
        }

        // add the triangles for this surface
        rb_surfaceTable[*drawSurf->surface](drawSurf->surface);
    }

    backEnd.refdef.floatTime = originalTime;

    // draw the contents of the last shader batch
    if (oldShader != NULL) {
        RB_EndSurface();
    }

    if (glConfig.framebufferObject)
        FBO_Bind(fbo);

    // go back to the world modelview matrix

    GL_SetModelviewMatrix(backEnd.viewParms.world.modelMatrix);

    glDepthRange(0, 1);
}

/*
============================================================================

RENDER BACK END FUNCTIONS

============================================================================
*/

/*
================
RB_SetGL2D

================
*/
static void RB_SetGL2D()
{
    mat4_t matrix;
    int width, height;

    if (backEnd.projection2D && backEnd.last2DFBO == glState.currentFBO)
        return;

    backEnd.projection2D = true;
    backEnd.last2DFBO = glState.currentFBO;

    if (glState.currentFBO) {
        width = glState.currentFBO->width;
        height = glState.currentFBO->height;
    } else {
        width = glConfig.vidWidth;
        height = glConfig.vidHeight;
    }

    // set 2D virtual screen size
    glViewport(0, 0, width, height);
    glScissor(0, 0, width, height);

    Mat4Ortho(0, width, height, 0, 0, 1, matrix);
    GL_SetProjectionMatrix(matrix);
    Mat4Identity(matrix);
    GL_SetModelviewMatrix(matrix);

    GL_State(GLS_DEPTHTEST_DISABLE | GLS_SRCBLEND_SRC_ALPHA | GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA);

    GL_Cull(CT_TWO_SIDED);

    // set time for 2D shaders
    backEnd.refdef.time = ri.Milliseconds();
    backEnd.refdef.floatTime = backEnd.refdef.time * 0.001;
}

/*
=============
RE_StretchRaw

FIXME: not exactly backend
Stretches a raw 32 bit power of 2 bitmap image over the given screen rectangle.
Used for cinematics.
=============
*/
void RE_StretchRaw(int x, int y, int w, int h, int cols, int rows, const uint8_t* data, int client, bool dirty)
{
    int i, j;
    int start, end;
    vec4_t quadVerts[4];
    vec2_t texCoords[4];

    if (!tr.registered) {
        return;
    }
    R_IssuePendingRenderCommands();

    if (tess.numIndexes) {
        RB_EndSurface();
    }

    // we definitely want to sync every frame for the cinematics
    glFinish();

    start = 0;
    if (r_speeds->integer) {
        start = ri.Milliseconds();
    }

    // make sure rows and cols are powers of 2
    for (i = 0; (1 << i) < cols; i++) {
    }
    for (j = 0; (1 << j) < rows; j++) {
    }
    if ((1 << i) != cols || (1 << j) != rows) {
        ri.Error(ERR_DROP, "Draw_StretchRaw: size not a power of 2: %i by %i", cols, rows);
    }

    RE_UploadCinematic(cols, rows, data, client, dirty);
    GL_BindToTMU(tr.scratchImage[client], TB_COLORMAP);

    if (r_speeds->integer) {
        end = ri.Milliseconds();
        ri.Printf(PRINT_ALL, "qglTexSubImage2D %i, %i: %i msec\n", cols, rows, end - start);
    }

    // FIXME: HUGE hack
    if (glConfig.framebufferObject) {
        FBO_Bind(backEnd.framePostProcessed ? NULL : tr.renderFbo);
    }

    RB_SetGL2D();

    VectorSet4(quadVerts[0], x, y, 0.0f, 1.0f);
    VectorSet4(quadVerts[1], x + w, y, 0.0f, 1.0f);
    VectorSet4(quadVerts[2], x + w, y + h, 0.0f, 1.0f);
    VectorSet4(quadVerts[3], x, y + h, 0.0f, 1.0f);

    VectorSet2(texCoords[0], 0.5f / cols, 0.5f / rows);
    VectorSet2(texCoords[1], (cols - 0.5f) / cols, 0.5f / rows);
    VectorSet2(texCoords[2], (cols - 0.5f) / cols, (rows - 0.5f) / rows);
    VectorSet2(texCoords[3], 0.5f / cols, (rows - 0.5f) / rows);

    GLSL_BindProgram(&tr.textureColorShader);

    GLSL_SetUniformMat4(&tr.textureColorShader, UNIFORM_MODELVIEWPROJECTIONMATRIX, glState.modelviewProjection);
    GLSL_SetUniformVec4(&tr.textureColorShader, UNIFORM_COLOR, colorWhite);

    RB_InstantQuad2(quadVerts, texCoords);
}

void RE_UploadCinematic(int cols, int rows, const uint8_t* data, int client, bool dirty)
{
    GLuint texture;

    if (!tr.scratchImage[client]) {
        ri.Printf(PRINT_WARNING, "RE_UploadCinematic: scratch images not initialized\n");
        return;
    }

    texture = tr.scratchImage[client]->texnum;

    // if the scratchImage isn't in the format we want, specify it as a new texture
    if (cols != tr.scratchImage[client]->width || rows != tr.scratchImage[client]->height) {
        tr.scratchImage[client]->width = tr.scratchImage[client]->uploadWidth = cols;
        tr.scratchImage[client]->height = tr.scratchImage[client]->uploadHeight = rows;
        GLDSA_TextureImage2DEXT(texture, GL_TEXTURE_2D, 0, GL_RGB8, cols, rows, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
        GLDSA_TextureParameterfEXT(texture, GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        GLDSA_TextureParameterfEXT(texture, GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        GLDSA_TextureParameterfEXT(texture, GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        GLDSA_TextureParameterfEXT(texture, GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    } else {
        if (dirty) {
            // otherwise, just subimage upload it so that drivers can tell we are going to be changing
            // it and don't try and do a texture compression
            GLDSA_TextureSubImage2DEXT(texture, GL_TEXTURE_2D, 0, 0, 0, cols, rows, GL_RGBA, GL_UNSIGNED_BYTE, data);
        }
    }
}

static const void* RB_SetColor(const void* data)
{
    const setColorCommand_t* cmd;

    cmd = (const setColorCommand_t*)data;

    backEnd.color2D[0] = cmd->color[0] * 255;
    backEnd.color2D[1] = cmd->color[1] * 255;
    backEnd.color2D[2] = cmd->color[2] * 255;
    backEnd.color2D[3] = cmd->color[3] * 255;

    return (const void*)(cmd + 1);
}

static const void* RB_StretchPic(const void* data)
{
    const stretchPicCommand_t* cmd;
    shader_t* shader;
    int numVerts, numIndexes;

    cmd = (const stretchPicCommand_t*)data;

    // FIXME: HUGE hack
    if (glConfig.framebufferObject)
        FBO_Bind(backEnd.framePostProcessed ? NULL : tr.renderFbo);

    RB_SetGL2D();

    shader = cmd->shader;
    if (shader != tess.shader) {
        if (tess.numIndexes) {
            RB_EndSurface();
        }
        backEnd.currentEntity = &backEnd.entity2D;
        RB_BeginSurface(shader, 0);
    }

    RB_CHECKOVERFLOW(4, 6);
    numVerts = tess.numVertexes;
    numIndexes = tess.numIndexes;

    tess.numVertexes += 4;
    tess.numIndexes += 6;

    tess.indexes[numIndexes] = numVerts + 3;
    tess.indexes[numIndexes + 1] = numVerts + 0;
    tess.indexes[numIndexes + 2] = numVerts + 2;
    tess.indexes[numIndexes + 3] = numVerts + 2;
    tess.indexes[numIndexes + 4] = numVerts + 0;
    tess.indexes[numIndexes + 5] = numVerts + 1;

    {
        uint16_t color[4];

        VectorScale4(backEnd.color2D, 257, color);

        VectorCopy4(color, tess.color[numVerts]);
        VectorCopy4(color, tess.color[numVerts + 1]);
        VectorCopy4(color, tess.color[numVerts + 2]);
        VectorCopy4(color, tess.color[numVerts + 3]);
    }

    tess.xyz[numVerts][0] = cmd->x;
    tess.xyz[numVerts][1] = cmd->y;
    tess.xyz[numVerts][2] = 0;

    tess.texCoords[numVerts][0] = cmd->s1;
    tess.texCoords[numVerts][1] = cmd->t1;

    tess.xyz[numVerts + 1][0] = cmd->x + cmd->w;
    tess.xyz[numVerts + 1][1] = cmd->y;
    tess.xyz[numVerts + 1][2] = 0;

    tess.texCoords[numVerts + 1][0] = cmd->s2;
    tess.texCoords[numVerts + 1][1] = cmd->t1;

    tess.xyz[numVerts + 2][0] = cmd->x + cmd->w;
    tess.xyz[numVerts + 2][1] = cmd->y + cmd->h;
    tess.xyz[numVerts + 2][2] = 0;

    tess.texCoords[numVerts + 2][0] = cmd->s2;
    tess.texCoords[numVerts + 2][1] = cmd->t2;

    tess.xyz[numVerts + 3][0] = cmd->x;
    tess.xyz[numVerts + 3][1] = cmd->y + cmd->h;
    tess.xyz[numVerts + 3][2] = 0;

    tess.texCoords[numVerts + 3][0] = cmd->s1;
    tess.texCoords[numVerts + 3][1] = cmd->t2;

    return (const void*)(cmd + 1);
}

static const void* RB_DrawSurfs(const void* data)
{
    const drawSurfsCommand_t* cmd;
    bool isShadowView;

    // finish any 2D drawing if needed
    if (tess.numIndexes) {
        RB_EndSurface();
    }

    cmd = (const drawSurfsCommand_t*)data;

    backEnd.refdef = cmd->refdef;
    backEnd.viewParms = cmd->viewParms;

    isShadowView = !!(backEnd.viewParms.flags & VPF_DEPTHSHADOW);

    // clear the z buffer, set the modelview, etc
    RB_BeginDrawingView();

    if (glConfig.framebufferObject && (backEnd.viewParms.flags & VPF_DEPTHCLAMP) && glConfig.depthClamp) {
        glEnable(GL_DEPTH_CLAMP);
    }

    if (glConfig.framebufferObject && !(backEnd.refdef.rdflags & RDF_NOWORLDMODEL) && (r_depthPrepass->integer || isShadowView)) {
        FBO_t* oldFbo = glState.currentFBO;
        vec4_t viewInfo;

        VectorSet4(viewInfo, backEnd.viewParms.zFar / r_znear->value, backEnd.viewParms.zFar, 0.0, 0.0);

        backEnd.depthFill = true;
        glColorMask(GL_FALSE, GL_FALSE, GL_FALSE, GL_FALSE);
        RB_RenderDrawSurfList(cmd->drawSurfs, cmd->numDrawSurfs);
        glColorMask(!backEnd.colorMask[0], !backEnd.colorMask[1], !backEnd.colorMask[2], !backEnd.colorMask[3]);
        backEnd.depthFill = false;

        if (!isShadowView) {
            if (tr.msaaResolveFbo) {
                // If we're using multisampling, resolve the depth first
                FBO_FastBlit(tr.renderFbo, NULL, tr.msaaResolveFbo, NULL, GL_DEPTH_BUFFER_BIT, GL_NEAREST);
            } else if (tr.renderFbo == NULL && tr.renderDepthImage) {
                // If we're rendering directly to the screen, copy the depth to a texture
                // This is incredibly slow on Intel Graphics, so just skip it on there
                if (!glConfig.intelGraphics)
                    GLDSA_CopyTextureSubImage2DEXT(tr.renderDepthImage->texnum, GL_TEXTURE_2D, 0, 0, 0, 0, 0, glConfig.vidWidth, glConfig.vidHeight);
            }

            if (tr.hdrDepthFbo) {
                // need the depth in a texture we can do GL_LINEAR sampling on, so copy it to an HDR image
                vec4_t srcTexCoords;

                VectorSet4(srcTexCoords, 0.0f, 0.0f, 1.0f, 1.0f);

                FBO_BlitFromTexture(tr.renderDepthImage, srcTexCoords, NULL, tr.hdrDepthFbo, NULL, NULL, NULL, 0);
            }

            if (r_sunlightMode->integer && backEnd.viewParms.flags & VPF_USESUNLIGHT) {
                vec4_t quadVerts[4];
                vec2_t texCoords[4];
                vec4_t box;

                FBO_Bind(tr.screenShadowFbo);

                box[0] = backEnd.viewParms.viewportX * tr.screenShadowFbo->width / (float)glConfig.vidWidth;
                box[1] = backEnd.viewParms.viewportY * tr.screenShadowFbo->height / (float)glConfig.vidHeight;
                box[2] = backEnd.viewParms.viewportWidth * tr.screenShadowFbo->width / (float)glConfig.vidWidth;
                box[3] = backEnd.viewParms.viewportHeight * tr.screenShadowFbo->height / (float)glConfig.vidHeight;

                glViewport(box[0], box[1], box[2], box[3]);
                glScissor(box[0], box[1], box[2], box[3]);

                box[0] = backEnd.viewParms.viewportX / (float)glConfig.vidWidth;
                box[1] = backEnd.viewParms.viewportY / (float)glConfig.vidHeight;
                box[2] = box[0] + backEnd.viewParms.viewportWidth / (float)glConfig.vidWidth;
                box[3] = box[1] + backEnd.viewParms.viewportHeight / (float)glConfig.vidHeight;

                texCoords[0][0] = box[0];
                texCoords[0][1] = box[3];
                texCoords[1][0] = box[2];
                texCoords[1][1] = box[3];
                texCoords[2][0] = box[2];
                texCoords[2][1] = box[1];
                texCoords[3][0] = box[0];
                texCoords[3][1] = box[1];

                box[0] = -1.0f;
                box[1] = -1.0f;
                box[2] = 1.0f;
                box[3] = 1.0f;

                VectorSet4(quadVerts[0], box[0], box[3], 0, 1);
                VectorSet4(quadVerts[1], box[2], box[3], 0, 1);
                VectorSet4(quadVerts[2], box[2], box[1], 0, 1);
                VectorSet4(quadVerts[3], box[0], box[1], 0, 1);

                GL_State(GLS_DEPTHTEST_DISABLE);

                GLSL_BindProgram(&tr.shadowmaskShader);

                GL_BindToTMU(tr.renderDepthImage, TB_COLORMAP);

                if (r_shadowCascadeZFar->integer != 0) {
                    GL_BindToTMU(tr.sunShadowDepthImage[0], TB_SHADOWMAP);
                    GL_BindToTMU(tr.sunShadowDepthImage[1], TB_SHADOWMAP2);
                    GL_BindToTMU(tr.sunShadowDepthImage[2], TB_SHADOWMAP3);
                    GL_BindToTMU(tr.sunShadowDepthImage[3], TB_SHADOWMAP4);

                    GLSL_SetUniformMat4(&tr.shadowmaskShader, UNIFORM_SHADOWMVP, backEnd.refdef.sunShadowMvp[0]);
                    GLSL_SetUniformMat4(&tr.shadowmaskShader, UNIFORM_SHADOWMVP2, backEnd.refdef.sunShadowMvp[1]);
                    GLSL_SetUniformMat4(&tr.shadowmaskShader, UNIFORM_SHADOWMVP3, backEnd.refdef.sunShadowMvp[2]);
                    GLSL_SetUniformMat4(&tr.shadowmaskShader, UNIFORM_SHADOWMVP4, backEnd.refdef.sunShadowMvp[3]);
                } else {
                    GL_BindToTMU(tr.sunShadowDepthImage[3], TB_SHADOWMAP);
                    GLSL_SetUniformMat4(&tr.shadowmaskShader, UNIFORM_SHADOWMVP, backEnd.refdef.sunShadowMvp[3]);
                }

                GLSL_SetUniformVec3(&tr.shadowmaskShader, UNIFORM_VIEWORIGIN, backEnd.refdef.vieworg);
                {
                    vec3_t viewVector;

                    float zmax = backEnd.viewParms.zFar;
                    float ymax = zmax * tan(backEnd.viewParms.fovY * M_PI / 360.0f);
                    float xmax = zmax * tan(backEnd.viewParms.fovX * M_PI / 360.0f);

                    VectorScale(backEnd.refdef.viewaxis[0], zmax, viewVector);
                    GLSL_SetUniformVec3(&tr.shadowmaskShader, UNIFORM_VIEWFORWARD, viewVector);
                    VectorScale(backEnd.refdef.viewaxis[1], xmax, viewVector);
                    GLSL_SetUniformVec3(&tr.shadowmaskShader, UNIFORM_VIEWLEFT, viewVector);
                    VectorScale(backEnd.refdef.viewaxis[2], ymax, viewVector);
                    GLSL_SetUniformVec3(&tr.shadowmaskShader, UNIFORM_VIEWUP, viewVector);

                    GLSL_SetUniformVec4(&tr.shadowmaskShader, UNIFORM_VIEWINFO, viewInfo);
                }

                RB_InstantQuad2(quadVerts, texCoords); //, color, shaderProgram, invTexRes);

                if (r_shadowBlur->integer) {
                    viewInfo[2] = 1.0f / (float)(tr.screenScratchFbo->width);
                    viewInfo[3] = 1.0f / (float)(tr.screenScratchFbo->height);

                    FBO_Bind(tr.screenScratchFbo);

                    GLSL_BindProgram(&tr.depthBlurShader[0]);

                    GL_BindToTMU(tr.screenShadowImage, TB_COLORMAP);
                    GL_BindToTMU(tr.hdrDepthImage, TB_LIGHTMAP);

                    GLSL_SetUniformVec4(&tr.depthBlurShader[0], UNIFORM_VIEWINFO, viewInfo);

                    RB_InstantQuad2(quadVerts, texCoords);

                    FBO_Bind(tr.screenShadowFbo);

                    GLSL_BindProgram(&tr.depthBlurShader[1]);

                    GL_BindToTMU(tr.screenScratchImage, TB_COLORMAP);
                    GL_BindToTMU(tr.hdrDepthImage, TB_LIGHTMAP);

                    GLSL_SetUniformVec4(&tr.depthBlurShader[1], UNIFORM_VIEWINFO, viewInfo);

                    RB_InstantQuad2(quadVerts, texCoords);
                }
            }
        }

        // reset viewport and scissor
        FBO_Bind(oldFbo);
        SetViewportAndScissor();
    }

    if (glConfig.framebufferObject && (backEnd.viewParms.flags & VPF_DEPTHCLAMP) && glConfig.depthClamp) {
        glDisable(GL_DEPTH_CLAMP);
    }

    if (!isShadowView) {
        RB_RenderDrawSurfList(cmd->drawSurfs, cmd->numDrawSurfs);

        // darken down any stencil shadows
        RB_ShadowFinish();

        // add light flares on lights that aren't obscured
        RB_RenderFlares();
    }

    return (const void*)(cmd + 1);
}

static const void* RB_DrawBuffer(const void* data)
{
    const drawBufferCommand_t* cmd;

    cmd = (const drawBufferCommand_t*)data;

    // finish any 2D drawing if needed
    if (tess.numIndexes)
        RB_EndSurface();

    if (glConfig.framebufferObject)
        FBO_Bind(NULL);

    glDrawBuffer(cmd->buffer);

    // clear screen for debugging
    if (r_clear->integer) {
        glClearColor(1, 0, 0.5, 1);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    }

    return (const void*)(cmd + 1);
}

/*
===============
RB_ShowImages

Draw all the images to the screen, on top of whatever
was there.  This is used to test for texture thrashing.

Also called by RE_EndRegistration
===============
*/
void RB_ShowImages()
{
    int i;
    image_t* image;
    float x, y, w, h;
    int start, end;

    RB_SetGL2D();

    glClear(GL_COLOR_BUFFER_BIT);

    glFinish();

    start = ri.Milliseconds();

    for (i = 0; i < tr.numImages; i++) {
        image = tr.images[i];

        w = glConfig.vidWidth / 20;
        h = glConfig.vidHeight / 15;
        x = i % 20 * w;
        y = i / 20 * h;

        // show in proportional size in mode 2
        if (r_showImages->integer == 2) {
            w *= image->uploadWidth / 512.0f;
            h *= image->uploadHeight / 512.0f;
        }

        {
            vec4_t quadVerts[4];

            GL_BindToTMU(image, TB_COLORMAP);

            VectorSet4(quadVerts[0], x, y, 0, 1);
            VectorSet4(quadVerts[1], x + w, y, 0, 1);
            VectorSet4(quadVerts[2], x + w, y + h, 0, 1);
            VectorSet4(quadVerts[3], x, y + h, 0, 1);

            RB_InstantQuad(quadVerts);
        }
    }

    glFinish();

    end = ri.Milliseconds();
    ri.Printf(PRINT_ALL, "%i msec to draw all images\n", end - start);
}

static const void* RB_ColorMask(const void* data)
{
    const colorMaskCommand_t* cmd = data;

    // finish any 2D drawing if needed
    if (tess.numIndexes)
        RB_EndSurface();

    if (glConfig.framebufferObject) {
        // reverse color mask, so 0 0 0 0 is the default
        backEnd.colorMask[0] = !cmd->rgba[0];
        backEnd.colorMask[1] = !cmd->rgba[1];
        backEnd.colorMask[2] = !cmd->rgba[2];
        backEnd.colorMask[3] = !cmd->rgba[3];
    }

    glColorMask(cmd->rgba[0], cmd->rgba[1], cmd->rgba[2], cmd->rgba[3]);

    return (const void*)(cmd + 1);
}

static const void* RB_ClearDepth(const void* data)
{
    const clearDepthCommand_t* cmd = data;

    // finish any 2D drawing if needed
    if (tess.numIndexes)
        RB_EndSurface();

    // texture swapping test
    if (r_showImages->integer)
        RB_ShowImages();

    if (glConfig.framebufferObject) {
        if (!tr.renderFbo || backEnd.framePostProcessed) {
            FBO_Bind(NULL);
        } else {
            FBO_Bind(tr.renderFbo);
        }
    }

    glClear(GL_DEPTH_BUFFER_BIT);

    // if we're doing MSAA, clear the depth texture for the resolve buffer
    if (tr.msaaResolveFbo) {
        FBO_Bind(tr.msaaResolveFbo);
        glClear(GL_DEPTH_BUFFER_BIT);
    }

    return (const void*)(cmd + 1);
}

static const void* RB_SwapBuffers(const void* data)
{
    const swapBuffersCommand_t* cmd;

    // finish any 2D drawing if needed
    if (tess.numIndexes) {
        RB_EndSurface();
    }

    // texture swapping test
    if (r_showImages->integer) {
        RB_ShowImages();
    }

    cmd = (const swapBuffersCommand_t*)data;

    // we measure overdraw by reading back the stencil buffer and
    // counting up the number of increments that have happened
    if (r_measureOverdraw->integer) {
        int i;
        long sum = 0;
        unsigned char* stencilReadback;

        stencilReadback = ri.Hunk_AllocateTempMemory(glConfig.vidWidth * glConfig.vidHeight);
        glReadPixels(0, 0, glConfig.vidWidth, glConfig.vidHeight, GL_STENCIL_INDEX, GL_UNSIGNED_BYTE, stencilReadback);

        for (i = 0; i < glConfig.vidWidth * glConfig.vidHeight; i++) {
            sum += stencilReadback[i];
        }

        backEnd.pc.c_overDraw += sum;
        ri.Hunk_FreeTempMemory(stencilReadback);
    }

    if (glConfig.framebufferObject) {
        if (!backEnd.framePostProcessed) {
            if (tr.msaaResolveFbo && r_hdr->integer) {
                // Resolving an RGB16F MSAA FBO to the screen messes with the brightness, so resolve to an RGB16F FBO first
                FBO_FastBlit(tr.renderFbo, NULL, tr.msaaResolveFbo, NULL, GL_COLOR_BUFFER_BIT, GL_NEAREST);
                FBO_FastBlit(tr.msaaResolveFbo, NULL, NULL, NULL, GL_COLOR_BUFFER_BIT, GL_NEAREST);
            } else if (tr.renderFbo) {
                FBO_FastBlit(tr.renderFbo, NULL, NULL, NULL, GL_COLOR_BUFFER_BIT, GL_NEAREST);
            }
        }
    }

    if (!glState.finishCalled) {
        glFinish();
    }

    GLimp_EndFrame();

    backEnd.framePostProcessed = false;
    backEnd.projection2D = false;

    return (const void*)(cmd + 1);
}

static const void* RB_CapShadowMap(const void* data)
{
    const capShadowmapCommand_t* cmd = data;

    // finish any 2D drawing if needed
    if (tess.numIndexes)
        RB_EndSurface();

    if (cmd->map != -1) {
        if (cmd->cubeSide != -1) {
            if (tr.shadowCubemaps[cmd->map]) {
                GLDSA_CopyTextureSubImage2DEXT(tr.shadowCubemaps[cmd->map]->texnum, GL_TEXTURE_CUBE_MAP_POSITIVE_X + cmd->cubeSide, 0, 0, 0, backEnd.refdef.x, glConfig.vidHeight - (backEnd.refdef.y + PSHADOW_MAP_SIZE), PSHADOW_MAP_SIZE, PSHADOW_MAP_SIZE);
            }
        } else {
            if (tr.pshadowMaps[cmd->map]) {
                GLDSA_CopyTextureSubImage2DEXT(tr.pshadowMaps[cmd->map]->texnum, GL_TEXTURE_2D, 0, 0, 0, backEnd.refdef.x, glConfig.vidHeight - (backEnd.refdef.y + PSHADOW_MAP_SIZE), PSHADOW_MAP_SIZE, PSHADOW_MAP_SIZE);
            }
        }
    }

    return (const void*)(cmd + 1);
}

static const void* RB_PostProcess(const void* data)
{
    const postProcessCommand_t* cmd = data;
    FBO_t* srcFbo;
    ivec4_t srcBox, dstBox;
    bool autoExposure;

    // finish any 2D drawing if needed
    if (tess.numIndexes)
        RB_EndSurface();

    if (!glConfig.framebufferObject || !r_postProcess->integer) {
        // do nothing
        return (const void*)(cmd + 1);
    }

    if (cmd) {
        backEnd.refdef = cmd->refdef;
        backEnd.viewParms = cmd->viewParms;
    }

    srcFbo = tr.renderFbo;
    if (tr.msaaResolveFbo) {
        // Resolve the MSAA before anything else
        // Can't resolve just part of the MSAA FBO, so multiple views will suffer a performance hit here
        FBO_FastBlit(tr.renderFbo, NULL, tr.msaaResolveFbo, NULL, GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT, GL_NEAREST);
        srcFbo = tr.msaaResolveFbo;
    }

    dstBox[0] = backEnd.viewParms.viewportX;
    dstBox[1] = backEnd.viewParms.viewportY;
    dstBox[2] = backEnd.viewParms.viewportWidth;
    dstBox[3] = backEnd.viewParms.viewportHeight;

    srcBox[0] = backEnd.viewParms.viewportX;
    srcBox[1] = backEnd.viewParms.viewportY;
    srcBox[2] = backEnd.viewParms.viewportWidth;
    srcBox[3] = backEnd.viewParms.viewportHeight;

    if (srcFbo) {
        if (r_hdr->integer && (r_toneMap->integer || r_forceToneMap->integer)) {
            autoExposure = r_autoExposure->integer || r_forceAutoExposure->integer;
            RB_ToneMap(srcFbo, srcBox, NULL, dstBox, autoExposure);
        } else if (r_cameraExposure->value == 0.0f) {
            FBO_FastBlit(srcFbo, srcBox, NULL, dstBox, GL_COLOR_BUFFER_BIT, GL_NEAREST);
        } else {
            vec4_t color;

            color[0] = color[1] = color[2] = pow(2, r_cameraExposure->value); // exp2(r_cameraExposure->value);
            color[3] = 1.0f;

            FBO_Blit(srcFbo, srcBox, NULL, NULL, dstBox, NULL, color, 0);
        }
    }

    backEnd.framePostProcessed = true;

    return (const void*)(cmd + 1);
}

void RB_ExecuteRenderCommands(const void* data)
{
    int t1, t2;

    t1 = ri.Milliseconds();

    while (1) {
        data = PADP(data, sizeof(void*));

        switch (*(const int*)data) {
        case RC_SET_COLOR:
            data = RB_SetColor(data);
            break;
        case RC_STRETCH_PIC:
            data = RB_StretchPic(data);
            break;
        case RC_DRAW_SURFS:
            data = RB_DrawSurfs(data);
            break;
        case RC_DRAW_BUFFER:
            data = RB_DrawBuffer(data);
            break;
        case RC_SWAP_BUFFERS:
            data = RB_SwapBuffers(data);
            break;
        case RC_SCREENSHOT:
            data = RB_TakeScreenshotCmd(data);
            break;
        case RC_VIDEOFRAME:
            data = RB_TakeVideoFrameCmd(data);
            break;
        case RC_COLORMASK:
            data = RB_ColorMask(data);
            break;
        case RC_CLEARDEPTH:
            data = RB_ClearDepth(data);
            break;
        case RC_CAPSHADOWMAP:
            data = RB_CapShadowMap(data);
            break;
        case RC_POSTPROCESS:
            data = RB_PostProcess(data);
            break;
        case RC_END_OF_LIST:
        default:
            // finish any 2D drawing if needed
            if (tess.numIndexes)
                RB_EndSurface();

            // stop rendering
            t2 = ri.Milliseconds();
            backEnd.pc.msec = t2 - t1;
            return;
        }
    }
}
