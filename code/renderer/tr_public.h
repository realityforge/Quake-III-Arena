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
#ifndef TR_PUBLIC_H
#define TR_PUBLIC_H

#include "tr_types.h"
#include "attributes.h"
#include "../qcommon/cvar_engine.h"

#define REF_API_VERSION 8

//
// these are the functions exported by the refresh module
//
typedef struct {
    // called before the library is unloaded
    // if the system is just reconfiguring, pass destroyWindow = false,
    // which will keep the screen from flashing to the desktop.
    void (*Shutdown)(bool destroyWindow);

    // All data that will be used in a level should be
    // registered before rendering any frames to prevent disk hits,
    // but they can still be registered at a later time
    // if necessary.
    //
    // BeginRegistration makes any existing media pointers invalid
    // and returns the current gl configuration, including screen width
    // and height, which can be used by the client to intelligently
    // size display elements
    void (*BeginRegistration)(glconfig_t* config);
    qhandle_t (*RegisterModel)(const char* name);
    qhandle_t (*RegisterSkin)(const char* name);
    qhandle_t (*RegisterShader)(const char* name);
    qhandle_t (*RegisterShaderNoMip)(const char* name);
    void (*LoadWorld)(const char* name);

    // the vis data is a large enough block of data that we go to the trouble
    // of sharing it with the clipmodel subsystem
    void (*SetWorldVisData)(const uint8_t* vis);

    // EndRegistration will draw a tiny polygon with each texture, forcing
    // them to be loaded into card memory
    void (*EndRegistration)(void);

    // a scene is built up by calls to R_ClearScene and the various R_Add functions.
    // Nothing is drawn until R_RenderScene is called.
    void (*ClearScene)(void);
    void (*AddRefEntityToScene)(const refEntity_t* re);
    void (*AddPolyToScene)(qhandle_t hShader, int numVerts, const polyVert_t* verts, int num);
    int (*LightForPoint)(vec3_t point, vec3_t ambientLight, vec3_t directedLight, vec3_t lightDir);
    void (*AddLightToScene)(const vec3_t org, float intensity, float r, float g, float b);
    void (*AddAdditiveLightToScene)(const vec3_t org, float intensity, float r, float g, float b);
    void (*RenderScene)(const refdef_t* fd);

    void (*SetColor)(const float* rgba); // NULL = 1,1,1,1
    void (*DrawStretchPic)(float x, float y, float w, float h,
                           float s1, float t1, float s2, float t2, qhandle_t hShader); // 0 = white

    // Draw images for cinematic rendering, pass as 32 bit rgba
    void (*DrawStretchRaw)(int x, int y, int w, int h, int cols, int rows, const uint8_t* data, int client, bool dirty);
    void (*UploadCinematic)(int cols, int rows, const uint8_t* data, int client, bool dirty);

    void (*BeginFrame)(stereoFrame_t stereoFrame);

    // if the pointers are not NULL, timing info will be returned
    void (*EndFrame)(int* frontEndMsec, int* backEndMsec);

    int (*MarkFragments)(int numPoints, const vec3_t* points, const vec3_t projection,
                         int maxPoints, vec3_t pointBuffer, int maxFragments, markFragment_t* fragmentBuffer);

    int (*LerpTag)(orientation_t* tag, qhandle_t model, int startFrame, int endFrame,
                   float frac, const char* tagName);
    void (*ModelBounds)(qhandle_t model, vec3_t mins, vec3_t maxs);

#ifdef __USEA3D
    void (*A3D_RenderGeometry)(void* pVoidA3D, void* pVoidGeom, void* pVoidMat, void* pVoidGeomStatus);
#endif
    void (*RegisterFont)(const char* fontName, int pointSize, fontInfo_t* font);
    void (*RemapShader)(const char* oldShader, const char* newShader, const char* offsetTime);
    bool (*GetEntityToken)(char* buffer, int size);
    bool (*inPVS)(const vec3_t p1, const vec3_t p2);
} refexport_t;

//
// these are the functions imported by the refresh module
//
typedef struct {
    // print message on the local console
    void(QDECL* Printf)(int printLevel, const char* fmt, ...) PRINTF_LIKE_FUNCTION(2, 3);

    // abort the game
    void(QDECL* Error)(int errorLevel, const char* fmt, ...) NORETURN PRINTF_LIKE_FUNCTION(2, 3);

    // milliseconds should only be used for profiling, never
    // for anything game related.  Get time from the refdef
    int (*Milliseconds)(void);

    // stack based memory allocation for per-level things that
    // won't be freed
#ifdef HUNK_DEBUG
    void* (*Hunk_AllocDebug)(int size, ha_pref pref, char* label, char* file, int line);
#else
    void* (*Hunk_Alloc)(int size, ha_pref pref);
#endif
    void* (*Hunk_AllocateTempMemory)(const size_t size);
    void (*Hunk_FreeTempMemory)(void* block);

    // dynamic memory allocator for things that need to be freed
    void* (*Malloc)(const size_t bytes);
    void (*Free)(void* buf);

    cvar_t* (*Cvar_Get)(const char* name, const char* value, int flags);
    void (*Cvar_Set)(const char* name, const char* value);

    void (*Cmd_AddCommand)(const char* name, void (*cmd)(void));
    void (*Cmd_RemoveCommand)(const char* name);

    int (*Cmd_Argc)(void);
    char* (*Cmd_Argv)(int i);

    void (*Cmd_ExecuteText)(int exec_when, const char* text);

    // visualization for debugging collision detection
    void (*CM_DrawDebugSurface)(void (*drawPoly)(int color, int numPoints, float* points));

    /**
     * Find the file with the specified name, if data parameter is non-null then allocate a buffer to
     * contain the content of the file and make the data pointer point at the new buffer. Return the size
     * of the file in bytes. The buffer MUST be released by passing it to the FS_FreeFile(void *) function.
     * The return value is 0 if no such file exists.
     *
     * @param name the name of the file.
     * @param buf the pointer to update with the location of the created buffer or NULL
     * @return the number of bytes in the file or 0 if no bytes.
     */
    int (*FS_ReadFile)(const char* name, void** buf);
    void (*FS_FreeFile)(void* buf);
    char** (*FS_ListFiles)(const char* name, const char* extension, int* numfilesfound);
    void (*FS_FreeFileList)(char** filelist);
    void (*FS_WriteFile)(const char* qpath, const void* buffer, int size);
    bool (*FS_FileExists)(const char* file);

    // cinematic stuff
    void (*CIN_UploadCinematic)(int handle);
    int (*CIN_PlayCinematic)(const char* arg0, int xpos, int ypos, int width, int height, int bits);
    e_status (*CIN_RunCinematic)(int handle);

} refimport_t;

// this is the only function actually exported at the linker level
// If the module can't init to a valid rendering state, NULL will be
// returned.
refexport_t* GetRefAPI(int apiVersion, refimport_t* rimp);

#endif // TR_PUBLIC_H
