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
// cg_syscalls.c -- this file is only included when building a dll
// cg_syscalls.asm is included instead when building a qvm
#ifdef Q3_VM
#error "Do not use in VM build"
#endif

#include "cg_local.h"
#include "plugin.h"

static vmDllSystemCall syscall = (vmDllSystemCall)-1;

EXPORT void dllEntry(vmDllSystemCall syscallptr)
{
    syscall = syscallptr;
}

static int PASSFLOAT(float x)
{
    float floatTemp;
    floatTemp = x;
    return *(int*)&floatTemp;
}

void trap_Print(const char* fmt)
{
    syscall(CG_PRINT, fmt);
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-noreturn"
NORETURN void trap_Error(const char* fmt)
{
    syscall(CG_ERROR, fmt);
}
#pragma clang diagnostic pop

int trap_Milliseconds()
{
    return syscall(CG_MILLISECONDS);
}

void trap_Cvar_Register(vmCvar_t* vmCvar, const char* varName, const char* defaultValue, int flags)
{
    syscall(CG_CVAR_REGISTER, vmCvar, varName, defaultValue, flags);
}

void trap_Cvar_Update(vmCvar_t* vmCvar)
{
    syscall(CG_CVAR_UPDATE, vmCvar);
}

void trap_Cvar_Set(const char* var_name, const char* value)
{
    syscall(CG_CVAR_SET, var_name, value);
}

void trap_Cvar_VariableStringBuffer(const char* var_name, char* buffer, int bufsize)
{
    syscall(CG_CVAR_VARIABLESTRINGBUFFER, var_name, buffer, bufsize);
}

int trap_Argc()
{
    return syscall(CG_ARGC);
}

void trap_Argv(int n, char* buffer, int bufferLength)
{
    syscall(CG_ARGV, n, buffer, bufferLength);
}

void trap_Args(char* buffer, int bufferLength)
{
    syscall(CG_ARGS, buffer, bufferLength);
}

int trap_FS_FOpenFile(const char* qpath, fileHandle_t* f, fsMode_t mode)
{
    return syscall(CG_FS_FOPENFILE, qpath, f, mode);
}

void trap_FS_Read(void* buffer, int len, fileHandle_t f)
{
    syscall(CG_FS_READ, buffer, len, f);
}

void trap_FS_Write(const void* buffer, int len, fileHandle_t f)
{
    syscall(CG_FS_WRITE, buffer, len, f);
}

void trap_FS_FCloseFile(fileHandle_t f)
{
    syscall(CG_FS_FCLOSEFILE, f);
}

void trap_SendConsoleCommand(const char* text)
{
    syscall(CG_SENDCONSOLECOMMAND, text);
}

void trap_AddCommand(const char* cmdName)
{
    syscall(CG_ADDCOMMAND, cmdName);
}

void trap_SendClientCommand(const char* s)
{
    syscall(CG_SENDCLIENTCOMMAND, s);
}

void trap_UpdateScreen()
{
    syscall(CG_UPDATESCREEN);
}

void trap_CM_LoadMap(const char* mapname)
{
    syscall(CG_CM_LOADMAP, mapname);
}

int trap_CM_NumInlineModels()
{
    return syscall(CG_CM_NUMINLINEMODELS);
}

clipHandle_t trap_CM_InlineModel(int index)
{
    return syscall(CG_CM_INLINEMODEL, index);
}

clipHandle_t trap_CM_TempBoxModel(const vec3_t mins, const vec3_t maxs)
{
    return syscall(CG_CM_TEMPBOXMODEL, mins, maxs);
}

int trap_CM_PointContents(const vec3_t p, clipHandle_t model)
{
    return syscall(CG_CM_POINTCONTENTS, p, model);
}

int trap_CM_TransformedPointContents(const vec3_t p, clipHandle_t model, const vec3_t origin, const vec3_t angles)
{
    return syscall(CG_CM_TRANSFORMEDPOINTCONTENTS, p, model, origin, angles);
}

void trap_CM_BoxTrace(trace_t* results, const vec3_t start, const vec3_t end,
                      const vec3_t mins, const vec3_t maxs,
                      clipHandle_t model, int brushmask)
{
    syscall(CG_CM_BOXTRACE, results, start, end, mins, maxs, model, brushmask);
}

void trap_CM_TransformedBoxTrace(trace_t* results, const vec3_t start, const vec3_t end,
                                 const vec3_t mins, const vec3_t maxs,
                                 clipHandle_t model, int brushmask,
                                 const vec3_t origin, const vec3_t angles)
{
    syscall(CG_CM_TRANSFORMEDBOXTRACE, results, start, end, mins, maxs, model, brushmask, origin, angles);
}

int trap_CM_MarkFragments(int numPoints, const vec3_t* points,
                          const vec3_t projection,
                          int maxPoints, vec3_t pointBuffer,
                          int maxFragments, markFragment_t* fragmentBuffer)
{
    return syscall(CG_CM_MARKFRAGMENTS, numPoints, points, projection, maxPoints, pointBuffer, maxFragments, fragmentBuffer);
}

void trap_S_StartSound(vec3_t origin, int entityNum, int entchannel, sfxHandle_t sfx)
{
    syscall(CG_S_STARTSOUND, origin, entityNum, entchannel, sfx);
}

void trap_S_StartLocalSound(sfxHandle_t sfx, int channelNum)
{
    syscall(CG_S_STARTLOCALSOUND, sfx, channelNum);
}

void trap_S_ClearLoopingSounds(bool killall)
{
    syscall(CG_S_CLEARLOOPINGSOUNDS, killall);
}

void trap_S_AddLoopingSound(int entityNum, const vec3_t origin, const vec3_t velocity, sfxHandle_t sfx)
{
    syscall(CG_S_ADDLOOPINGSOUND, entityNum, origin, velocity, sfx);
}

void trap_S_AddRealLoopingSound(int entityNum, const vec3_t origin, const vec3_t velocity, sfxHandle_t sfx)
{
    syscall(CG_S_ADDREALLOOPINGSOUND, entityNum, origin, velocity, sfx);
}

void trap_S_StopLoopingSound(int entityNum)
{
    syscall(CG_S_STOPLOOPINGSOUND, entityNum);
}

void trap_S_UpdateEntityPosition(int entityNum, const vec3_t origin)
{
    syscall(CG_S_UPDATEENTITYPOSITION, entityNum, origin);
}

void trap_S_Respatialize(int entityNum, const vec3_t origin, vec3_t axis[3], int inwater)
{
    syscall(CG_S_RESPATIALIZE, entityNum, origin, axis, inwater);
}

sfxHandle_t trap_S_RegisterSound(const char* sample, bool compressed)
{
    return syscall(CG_S_REGISTERSOUND, sample, compressed);
}

void trap_S_StartBackgroundTrack(const char* intro, const char* loop)
{
    syscall(CG_S_STARTBACKGROUNDTRACK, intro, loop);
}

void trap_R_LoadWorldMap(const char* mapname)
{
    syscall(CG_R_LOADWORLDMAP, mapname);
}

qhandle_t trap_R_RegisterModel(const char* name)
{
    return syscall(CG_R_REGISTERMODEL, name);
}

qhandle_t trap_R_RegisterSkin(const char* name)
{
    return syscall(CG_R_REGISTERSKIN, name);
}

qhandle_t trap_R_RegisterShader(const char* name)
{
    return syscall(CG_R_REGISTERSHADER, name);
}

qhandle_t trap_R_RegisterShaderNoMip(const char* name)
{
    return syscall(CG_R_REGISTERSHADERNOMIP, name);
}

void trap_R_RegisterFont(const char* fontName, int pointSize, fontInfo_t* font)
{
    syscall(CG_R_REGISTERFONT, fontName, pointSize, font);
}

void trap_R_ClearScene()
{
    syscall(CG_R_CLEARSCENE);
}

void trap_R_AddRefEntityToScene(const refEntity_t* re)
{
    syscall(CG_R_ADDREFENTITYTOSCENE, re);
}

void trap_R_AddPolyToScene(qhandle_t hShader, int numVerts, const polyVert_t* verts)
{
    syscall(CG_R_ADDPOLYTOSCENE, hShader, numVerts, verts);
}

void trap_R_AddLightToScene(const vec3_t org, float intensity, float r, float g, float b)
{
    syscall(CG_R_ADDLIGHTTOSCENE, org, PASSFLOAT(intensity), PASSFLOAT(r), PASSFLOAT(g), PASSFLOAT(b));
}

void trap_R_RenderScene(const refdef_t* fd)
{
    syscall(CG_R_RENDERSCENE, fd);
}

void trap_R_SetColor(const float* rgba)
{
    syscall(CG_R_SETCOLOR, rgba);
}

void trap_R_DrawStretchPic(float x, float y, float w, float h,
                           float s1, float t1, float s2, float t2, qhandle_t hShader)
{
    syscall(CG_R_DRAWSTRETCHPIC, PASSFLOAT(x), PASSFLOAT(y), PASSFLOAT(w), PASSFLOAT(h), PASSFLOAT(s1), PASSFLOAT(t1), PASSFLOAT(s2), PASSFLOAT(t2), hShader);
}

void trap_R_ModelBounds(clipHandle_t model, vec3_t mins, vec3_t maxs)
{
    syscall(CG_R_MODELBOUNDS, model, mins, maxs);
}

int trap_R_LerpTag(orientation_t* tag, clipHandle_t mod, int startFrame, int endFrame,
                   float frac, const char* tagName)
{
    return syscall(CG_R_LERPTAG, tag, mod, startFrame, endFrame, PASSFLOAT(frac), tagName);
}

void trap_R_RemapShader(const char* oldShader, const char* newShader, const char* timeOffset)
{
    syscall(CG_R_REMAP_SHADER, oldShader, newShader, timeOffset);
}

void trap_GetGlconfig(glconfig_t* glconfig)
{
    syscall(CG_GETGLCONFIG, glconfig);
}

void trap_GetGameState(gameState_t* gamestate)
{
    syscall(CG_GETGAMESTATE, gamestate);
}

void trap_GetCurrentSnapshotNumber(int* snapshotNumber, int* serverTime)
{
    syscall(CG_GETCURRENTSNAPSHOTNUMBER, snapshotNumber, serverTime);
}

bool trap_GetSnapshot(int snapshotNumber, snapshot_t* snapshot)
{
    return syscall(CG_GETSNAPSHOT, snapshotNumber, snapshot);
}

bool trap_GetServerCommand(int serverCommandNumber)
{
    return syscall(CG_GETSERVERCOMMAND, serverCommandNumber);
}

int trap_GetCurrentCmdNumber()
{
    return syscall(CG_GETCURRENTCMDNUMBER);
}

bool trap_GetUserCmd(int cmdNumber, usercmd_t* ucmd)
{
    return syscall(CG_GETUSERCMD, cmdNumber, ucmd);
}

void trap_SetUserCmdValue(int stateValue, float sensitivityScale)
{
    syscall(CG_SETUSERCMDVALUE, stateValue, PASSFLOAT(sensitivityScale));
}

int trap_MemoryRemaining()
{
    return syscall(CG_MEMORY_REMAINING);
}

bool trap_Key_IsDown(int keynum)
{
    return syscall(CG_KEY_ISDOWN, keynum);
}

int trap_Key_GetCatcher()
{
    return syscall(CG_KEY_GETCATCHER);
}

void trap_Key_SetCatcher(int catcher)
{
    syscall(CG_KEY_SETCATCHER, catcher);
}

int trap_PC_LoadSource(const char* filename)
{
    return syscall(CG_PC_LOAD_SOURCE, filename);
}

int trap_PC_FreeSource(int handle)
{
    return syscall(CG_PC_FREE_SOURCE, handle);
}

int trap_PC_ReadToken(int handle, pc_token_t* pc_token)
{
    return syscall(CG_PC_READ_TOKEN, handle, pc_token);
}

int trap_PC_SourceFileAndLine(int handle, char* filename, int* line)
{
    return syscall(CG_PC_SOURCE_FILE_AND_LINE, handle, filename, line);
}

void trap_S_StopBackgroundTrack()
{
    syscall(CG_S_STOPBACKGROUNDTRACK);
}

int trap_RealTime(qtime_t* qtime)
{
    return syscall(CG_REAL_TIME, qtime);
}

void trap_SnapVector(float* v)
{
    syscall(CG_SNAPVECTOR, v);
}

// this returns a handle.  arg0 is the name in the format "idlogo.roq", set arg1 to NULL, alteredstates to false (do not alter gamestate)
int trap_CIN_PlayCinematic(const char* arg0, int xpos, int ypos, int width, int height, int bits)
{
    return syscall(CG_CIN_PLAYCINEMATIC, arg0, xpos, ypos, width, height, bits);
}

// stops playing the cinematic and ends it.  should always return FMV_EOF
// cinematics must be stopped in reverse order of when they are started
e_status trap_CIN_StopCinematic(int handle)
{
    return syscall(CG_CIN_STOPCINEMATIC, handle);
}

// will run a frame of the cinematic but will not draw it.  Will return FMV_EOF if the end of the cinematic has been reached.
e_status trap_CIN_RunCinematic(int handle)
{
    return syscall(CG_CIN_RUNCINEMATIC, handle);
}

// draws the current frame
void trap_CIN_DrawCinematic(int handle)
{
    syscall(CG_CIN_DRAWCINEMATIC, handle);
}

// allows you to resize the animation dynamically
void trap_CIN_SetExtents(int handle, int x, int y, int w, int h)
{
    syscall(CG_CIN_SETEXTENTS, handle, x, y, w, h);
}

bool trap_GetEntityToken(char* buffer, int bufferSize)
{
    return syscall(CG_GET_ENTITY_TOKEN, buffer, bufferSize);
}
