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
#ifndef TR_TYPES_H
#define TR_TYPES_H

#include "lang_util.h"

#define MAX_DLIGHTS 32 // can't be increased, because bit flags are used on surfaces

#define REFENTITYNUM_BITS 10 // can't be increased without changing drawsurf bit packing
#define REFENTITYNUM_MASK ((1 << REFENTITYNUM_BITS) - 1)
// the last N-bit number (2^REFENTITYNUM_BITS - 1) is reserved for the special world refentity,
//  and this is reflected by the value of MAX_REFENTITIES (which therefore is not a power-of-2)
#define MAX_REFENTITIES ((1 << REFENTITYNUM_BITS) - 1)
#define REFENTITYNUM_WORLD ((1 << REFENTITYNUM_BITS) - 1)

// renderfx flags
#define RF_MINLIGHT BIT(1) // always have some light (viewmodel, some items)
#define RF_THIRD_PERSON BIT(2) // don't draw through eyes, only mirrors (player bodies, chat sprites)
#define RF_FIRST_PERSON BIT(3) // only draw through eyes (view weapon, damage blood blob)
#define RF_DEPTHHACK BIT(4) // for view weapon Z crunching

#define RF_CROSSHAIR BIT(5) // This item is a cross hair and will draw over everything similar to
                            // DEPTHHACK in stereo rendering mode, with the difference that the
                            // projection matrix won't be hacked to reduce the stereo separation as
                            // is done for the gun.

#define RF_NOSHADOW BIT(7) // don't add stencil shadows

#define RF_LIGHTING_ORIGIN BIT(8) // use refEntity->lightingOrigin instead of refEntity->origin
                                  // for lighting.  This allows entities to sink into the floor
                                  // with their origin going solid, and allows all parts of a
                                  // player to get the same lighting

#define RF_SHADOW_PLANE BIT(9) // use refEntity->shadowPlane
#define RF_WRAP_FRAMES BIT(10) // mod the model frames by the maxframes to allow continuous
                               // animation without needing to know the frame count

// refdef flags
#define RDF_NOWORLDMODEL BIT(1) // used for player configuration screen
#define RDF_HYPERSPACE BIT(3) // teleportation effect
#define RDF_NOFOG BIT(4) // don't apply fog to polys added using RE_AddPolyToScene

typedef struct {
    vec3_t xyz;
    float st[2];
    uint8_t modulate[4];
} polyVert_t;

typedef struct poly_s {
    qhandle_t hShader;
    int numVerts;
    polyVert_t* verts;
} poly_t;

typedef enum {
    RT_MODEL,
    RT_POLY,
    RT_SPRITE,
    RT_BEAM,
    RT_RAIL_CORE,
    RT_RAIL_RINGS,
    RT_LIGHTNING,
    RT_PORTALSURFACE, // doesn't draw anything, just info for portals

    RT_MAX_REF_ENTITY_TYPE
} refEntityType_t;

typedef struct {
    refEntityType_t reType;
    int renderfx;

    qhandle_t hModel; // opaque type outside refresh

    // most recent data
    vec3_t lightingOrigin; // so multi-part models can be lit identically (RF_LIGHTING_ORIGIN)
    float shadowPlane; // projection shadows go here, stencils go slightly lower

    vec3_t axis[3]; // rotation vectors
    bool nonNormalizedAxes; // axis are not normalized, i.e. they have scale
    float origin[3]; // also used as MODEL_BEAM's "from"
    int frame; // also used as MODEL_BEAM's diameter

    // previous data for frame interpolation
    float oldorigin[3]; // also used as MODEL_BEAM's "to"
    int oldframe;
    float backlerp; // 0.0 = current, 1.0 = old

    // texturing
    int skinNum; // inline skin index
    qhandle_t customSkin; // NULL for default skin
    qhandle_t customShader; // use one image for the entire thing

    // misc
    uint8_t shaderRGBA[4]; // colors used by rgbgen entity shaders
    float shaderTexCoord[2]; // texture coordinates used by tcMod entity modifiers
    float shaderTime; // subtracted from refdef time to control effect start times

    // extra sprite information
    float radius;
    float rotation;
} refEntity_t;

#define MAX_RENDER_STRINGS 8
#define MAX_RENDER_STRING_LENGTH 32

typedef struct {
    int x, y, width, height;
    float fov_x, fov_y;
    vec3_t vieworg;
    vec3_t viewaxis[3]; // transformation matrix

    // time in milliseconds for shader effects and other time dependent rendering issues
    int time;

    int rdflags; // RDF_NOWORLDMODEL, etc

    // 1 bits will prevent the associated area from rendering at all
    uint8_t areamask[MAX_MAP_AREA_BYTES];

    // text messages for deform text shaders
    char text[MAX_RENDER_STRINGS][MAX_RENDER_STRING_LENGTH];
} refdef_t;

typedef enum {
    STEREO_CENTER,
    STEREO_LEFT,
    STEREO_RIGHT
} stereoFrame_t;

/*
** glconfig_t
**
** Contains variables specific to the OpenGL configuration
** being run right now.  These are constant once the OpenGL
** subsystem is initialized.
*/
typedef enum {
    TC_NONE = 0x0000,
    TC_S3TC = 0x0001,
    TC_RGTC = 0x0002,
    TC_BPTC = 0x0004,
} textureCompression_t;

typedef enum {
    MI_NONE,
    MI_NVX,
    MI_ATI
} memInfo_t;

typedef struct {
    char renderer_string[MAX_STRING_CHARS];
    char vendor_string[MAX_STRING_CHARS];
    char version_string[MAX_STRING_CHARS];
    char extensions_string[BIG_INFO_STRING];

    int maxTextureSize; // queried from GL
    int maxActiveTextures; // multitexture ability

    int colorBits, depthBits, stencilBits;

    bool deviceSupportsGamma;
    textureCompression_t textureCompression;
    bool textureEnvAddAvailable;

    int vidWidth, vidHeight;
    // aspect is the screen's physical width / height, which may be different
    // from scrWidth / scrHeight if the pixels are non-square
    // normal screens should be 4/3, but wide aspect monitors may be 16/9
    float windowAspect;

    int displayFrequency;

    // synonymous with "does rendering consume the entire screen?", therefore
    // a Voodoo or Voodoo2 will have this set to TRUE, as will a Win32 ICD that
    // used CDS.
    bool isFullscreen;
    bool stereoEnabled;

    bool textureFilterAnisotropic;
    int maxAnisotropy;

    bool intelGraphics;

    int glslMajorVersion;
    int glslMinorVersion;

    memInfo_t memInfo;

    bool framebufferObject;
    int maxRenderbufferSize;
    int maxColorAttachments;

    bool textureFloat;
    bool swizzleNormalmap;

    bool framebufferMultisample;
    bool framebufferBlit;

    bool depthClamp;
    bool seamlessCubeMap;

    bool vertexArrayObject;
} glconfig_t;

#endif // TR_TYPES_H
