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
#ifndef TR_COMMON_H
#define TR_COMMON_H

#include "../qcommon/q_shared.h"
#include "../qcommon/cvar_engine.h"
#include "tr_public.h"
#ifdef DEBUG
void R_PrintGLError(const char* error_message);
#define GLA_AUTO_CHECK_ERROR_HANDLER R_PrintGLError
#endif
#include "GLA/gla.h"

typedef enum {
    IMGTYPE_COLORALPHA, // for color, lightmap, diffuse, and specular
    IMGTYPE_NORMAL,
    IMGTYPE_NORMALHEIGHT,
    IMGTYPE_DELUXE, // normals are swizzled, deluxe are not
} imgType_t;

typedef enum {
    IMGFLAG_NONE = 0x0000,
    IMGFLAG_MIPMAP = 0x0001,
    IMGFLAG_PICMIP = 0x0002,
    IMGFLAG_CUBEMAP = 0x0004,
    IMGFLAG_NO_COMPRESSION = 0x0010,
    IMGFLAG_NOLIGHTSCALE = 0x0020,
    IMGFLAG_CLAMPTOEDGE = 0x0040,
    IMGFLAG_GENNORMALMAP = 0x0080,
} imgFlags_t;

typedef struct image_s {
    char imgName[MAX_QPATH]; // game path, including extension
    int width, height; // source image
    int uploadWidth, uploadHeight; // after power of two and picmip but not including clamp to MAX_TEXTURE_SIZE
    GLuint texnum; // gl texture binding

    int frameUsed; // for texture usage in frame statistics

    int internalFormat;

    imgType_t type;
    imgFlags_t flags;

    struct image_s* next;
} image_t;

// any change in the LIGHTMAP_* defines here MUST be reflected in
// R_FindShader() in tr_bsp.c
#define LIGHTMAP_2D -4 // shader is for 2D rendering
#define LIGHTMAP_BY_VERTEX -3 // pre-lit triangle models
#define LIGHTMAP_WHITEIMAGE -2
#define LIGHTMAP_NONE -1

extern refimport_t ri;
extern glconfig_t glConfig; // outside of TR since it shouldn't be cleared during ref re-init

extern float displayAspect;

//
// cvars
//

extern cvar_t* r_stencilbits; // number of desired stencil bits
extern cvar_t* r_depthbits; // number of desired depth bits
extern cvar_t* r_colorbits; // number of desired color bits, only relevant for fullscreen
extern cvar_t* r_texturebits; // number of desired texture bits
extern cvar_t* r_ext_multisample;
// 0 = use framebuffer depth
// 16 = use 16-bit textures
// 32 = use 32-bit textures
// all else = error

extern cvar_t* r_mode; // video mode
extern cvar_t* r_noborder;
extern cvar_t* r_fullscreen;
extern cvar_t* r_ignorehwgamma; // overrides hardware gamma capabilities
extern cvar_t* r_drawBuffer;
extern cvar_t* r_swapInterval;

extern cvar_t* r_allowExtensions; // global enable/disable of OpenGL extensions
extern cvar_t* r_ext_compressed_textures; // these control use of specific extensions

extern cvar_t* r_ext_texture_filter_anisotropic;
extern cvar_t* r_ext_max_anisotropy;

extern cvar_t* r_stereoEnabled;

extern cvar_t* r_saveFontData;

bool R_GetModeInfo(int* width, int* height, float* windowAspect, int mode);

float R_NoiseGet4f(float x, float y, float z, double t);
void R_NoiseInit(void);

image_t* R_FindImageFile(const char* name, imgType_t type, imgFlags_t flags);
image_t* R_CreateImage(const char* name, uint8_t* pic, int width, int height, imgType_t type, imgFlags_t flags, int internalFormat);

qhandle_t RE_RegisterShaderLightMap(const char* name, int lightmapIndex);
qhandle_t RE_RegisterShader(const char* name);
qhandle_t RE_RegisterShaderNoMip(const char* name);
qhandle_t RE_RegisterShaderFromImage(const char* name, int lightmapIndex, image_t* image);

// font stuff
void R_InitFreeType(void);
void R_DoneFreeType(void);
void RE_RegisterFont(const char* fontName, int pointSize, fontInfo_t* font);

/*
=============================================================

IMAGE LOADERS

=============================================================
*/

void RE_SavePNG(const char* filename, uint32_t image_width, uint32_t image_height, uint8_t* image_buffer, uint16_t padding);
void RE_SaveJPG(const char* filename, int quality, uint32_t image_width, uint32_t image_height, uint8_t* image_buffer, uint16_t padding);
size_t RE_SaveJPGToBuffer(uint8_t* buffer, size_t bufSize, int quality, uint32_t image_width, uint32_t image_height, uint8_t* image_buffer, uint16_t padding);

/*
====================================================================

IMPLEMENTATION SPECIFIC FUNCTIONS

====================================================================
*/

void GLimp_Init(void);
void GLimp_Shutdown(void);
void GLimp_EndFrame(void);

void GLimp_Minimize(void);

void GLimp_SetGamma(unsigned char red[256],
                    unsigned char green[256],
                    unsigned char blue[256]);

#endif
