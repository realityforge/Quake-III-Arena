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
#include "qcommon.h"
#include "ui_local.h"

// this file is only included when building a dll
// syscalls.asm is included instead when building a qvm
#ifdef Q3_VM
#error "Do not use in VM build"
#endif

#pragma clang diagnostic ignored "-Wvariadic-macros"
#pragma clang diagnostic ignored "-Wgnu-zero-variadic-macro-arguments"
#ifdef TRACE_UI_VM
#define VMTRACE(code, fmt, args...) trap_Print(va("TRACE %s:%d %s(" fmt ")[Code=%s (%d)]\n", __FILE__, __LINE__, __func__, ##args, #code, code))
#define VMVTRACE(code) trap_Print(va("TRACE %s:%d %s()[Code=%s (%d)]\n", __FILE__, __LINE__, __func__, #code, code))
#else
#define VMTRACE(code, fmt, args...)
#define VMVTRACE(code)
#endif

static vmDllSystemCall syscall = (vmDllSystemCall)-1;

Q_EXPORT void dllEntry(vmDllSystemCall syscallptr)
{
    syscall = syscallptr;
}

int PASSFLOAT(float x)
{
    floatint_t fi;
    fi.f = x;
    return fi.i;
}

void trap_Print(const char* string)
{
    syscall(UI_PRINT, string);
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-noreturn"
NORETURN void trap_Error(const char* string)
{
    VMTRACE(UI_ERROR, "string=%s", string);
    syscall(UI_ERROR, string);
}
#pragma clang diagnostic pop

int trap_Milliseconds(void)
{
    VMVTRACE(UI_MILLISECONDS);
    return syscall(UI_MILLISECONDS);
}

void trap_Cvar_Register(vmCvar_t* cvar, const char* var_name, const char* value, int flags)
{
    VMTRACE(UI_CVAR_REGISTER, "handle=%d, name=%s, value=%s, flags=%d", (cvar ? cvar->handle : 0), var_name, value, flags);
    syscall(UI_CVAR_REGISTER, cvar, var_name, value, flags);
}

void trap_Cvar_Update(vmCvar_t* cvar)
{
    VMTRACE(UI_CVAR_UPDATE, "handle=%d", cvar->handle);
    syscall(UI_CVAR_UPDATE, cvar);
}

void trap_Cvar_Set(const char* var_name, const char* value)
{
    VMTRACE(UI_CVAR_SET, "name=%s, value=%s", var_name, value);
    syscall(UI_CVAR_SET, var_name, value);
}

float trap_Cvar_VariableValue(const char* var_name)
{
    VMTRACE(UI_CVAR_VARIABLEVALUE, "name=%s", var_name);
    floatint_t fi;
    fi.i = syscall(UI_CVAR_VARIABLEVALUE, var_name);
    return fi.f;
}

void trap_Cvar_VariableStringBuffer(const char* var_name, char* buffer, int bufsize)
{
    VMTRACE(UI_CVAR_VARIABLESTRINGBUFFER, "name=%s, size=%d", var_name, bufsize);
    syscall(UI_CVAR_VARIABLESTRINGBUFFER, var_name, buffer, bufsize);
}

void trap_Cvar_SetValue(const char* var_name, float value)
{
    VMTRACE(UI_CVAR_SETVALUE, "name=%s, size=%f", var_name, value);
    syscall(UI_CVAR_SETVALUE, var_name, PASSFLOAT(value));
}

void trap_Cvar_Reset(const char* name)
{
    VMTRACE(UI_CVAR_RESET, "name=%s", name);
    syscall(UI_CVAR_RESET, name);
}

void trap_Cvar_Create(const char* var_name, const char* var_value, int flags)
{
    VMTRACE(UI_CVAR_CREATE, "name=%s, value=%s, flags=%d", var_name, var_value, flags);
    syscall(UI_CVAR_CREATE, var_name, var_value, flags);
}

int trap_Argc(void)
{
    VMVTRACE(UI_ARGC);
    return syscall(UI_ARGC);
}

void trap_Argv(int n, char* buffer, int bufferLength)
{
    VMTRACE(UI_ARGV, "n=%d", n);
    syscall(UI_ARGV, n, buffer, bufferLength);
}

void trap_Cmd_ExecuteText(int exec_when, const char* text)
{
    VMTRACE(UI_ARGV, "when=%d, text=%s", exec_when, text);
    syscall(UI_CMD_EXECUTETEXT, exec_when, text);
}

int trap_FS_FOpenFile(const char* qpath, fileHandle_t* f, fsMode_t mode)
{
    VMTRACE(UI_FS_FOPENFILE, "path=%s, mode=%d", qpath, mode);
    return syscall(UI_FS_FOPENFILE, qpath, f, mode);
}

void trap_FS_Read(void* buffer, int len, fileHandle_t f)
{
    VMTRACE(UI_FS_READ, "handle=%d, len=%d", f, len);
    syscall(UI_FS_READ, buffer, len, f);
}

void trap_FS_Write(const void* buffer, int len, fileHandle_t f)
{
    VMTRACE(UI_FS_WRITE, "handle=%d, len=%d", f, len);
    syscall(UI_FS_WRITE, buffer, len, f);
}

void trap_FS_FCloseFile(fileHandle_t f)
{
    VMTRACE(UI_FS_FCLOSEFILE, "handle=%d", f);
    syscall(UI_FS_FCLOSEFILE, f);
}

int trap_FS_GetFileList(const char* path, const char* extension, char* listbuf, int bufsize)
{
    VMTRACE(UI_FS_GETFILELIST, "path=%s, extension=%s", path, extension);
    return syscall(UI_FS_GETFILELIST, path, extension, listbuf, bufsize);
}

qhandle_t trap_R_RegisterModel(const char* name)
{
    VMTRACE(UI_R_REGISTERMODEL, "name=%s", name);
    return syscall(UI_R_REGISTERMODEL, name);
}

qhandle_t trap_R_RegisterSkin(const char* name)
{
    VMTRACE(UI_R_REGISTERSKIN, "name=%s", name);
    return syscall(UI_R_REGISTERSKIN, name);
}

void trap_R_RegisterFont(const char* fontName, int pointSize, fontInfo_t* font)
{
    VMTRACE(UI_R_REGISTERFONT, "fontName=%s, pointSize=%d", fontName, pointSize);
    syscall(UI_R_REGISTERFONT, fontName, pointSize, font);
}

qhandle_t trap_R_RegisterShaderNoMip(const char* name)
{
    VMTRACE(UI_R_REGISTERSHADERNOMIP, "name=%s", name);
    return syscall(UI_R_REGISTERSHADERNOMIP, name);
}

void trap_R_ClearScene(void)
{
    VMVTRACE(UI_R_REGISTERSHADERNOMIP);
    syscall(UI_R_CLEARSCENE);
}

void trap_R_AddRefEntityToScene(const refEntity_t* re)
{
    VMVTRACE(UI_R_ADDREFENTITYTOSCENE);
    syscall(UI_R_ADDREFENTITYTOSCENE, re);
}

void trap_R_AddPolyToScene(qhandle_t hShader, int numVerts, const polyVert_t* verts)
{
    VMTRACE(UI_S_STOPBACKGROUNDTRACK, "hShader=%d, numVerts=%d", hShader, numVerts);
    syscall(UI_R_ADDPOLYTOSCENE, hShader, numVerts, verts);
}

void trap_R_AddLightToScene(const vec3_t org, float intensity, float r, float g, float b)
{
    VMTRACE(UI_R_ADDLIGHTTOSCENE, "org=(%f,%f,%f), intensity=%f, rgb=(%f,%f,%f)", org[0], org[1], org[2], intensity, r, g, b);
    syscall(UI_R_ADDLIGHTTOSCENE, org, PASSFLOAT(intensity), PASSFLOAT(r), PASSFLOAT(g), PASSFLOAT(b));
}

void trap_R_RenderScene(const refdef_t* fd)
{
    VMTRACE(UI_R_RENDERSCENE, "x=%d, y=%d, width=%d, height=%d, fov_c=%f, fov_y=%f", fd->x, fd->y, fd->width, fd->height, fd->fov_x, fd->fov_y);
    syscall(UI_R_RENDERSCENE, fd);
}

void trap_R_SetColor(const float* rgba)
{
    if (rgba)
        VMTRACE(UI_R_SETCOLOR, "rgba=(%f,%f,%f,%f)", rgba[0], rgba[1], rgba[2], rgba[3]);
    else
        VMTRACE(UI_R_SETCOLOR, "rgba=NULL");
    syscall(UI_R_SETCOLOR, rgba);
}

void trap_R_DrawStretchPic(float x, float y, float w, float h, float s1, float t1, float s2, float t2, qhandle_t hShader)
{
    syscall(UI_R_DRAWSTRETCHPIC, PASSFLOAT(x), PASSFLOAT(y), PASSFLOAT(w), PASSFLOAT(h), PASSFLOAT(s1), PASSFLOAT(t1), PASSFLOAT(s2), PASSFLOAT(t2), hShader);
}

void trap_R_ModelBounds(clipHandle_t model, vec3_t mins, vec3_t maxs)
{
    syscall(UI_R_MODELBOUNDS, model, mins, maxs);
}

void trap_UpdateScreen(void)
{
    VMVTRACE(UI_UPDATESCREEN);
    syscall(UI_UPDATESCREEN);
}

int trap_CM_LerpTag(orientation_t* tag, clipHandle_t mod, int startFrame, int endFrame, float frac, const char* tagName)
{
    return syscall(UI_CM_LERPTAG, tag, mod, startFrame, endFrame, PASSFLOAT(frac), tagName);
}

void trap_S_StartLocalSound(sfxHandle_t sfx, int channelNum)
{
    syscall(UI_S_STARTLOCALSOUND, sfx, channelNum);
}

sfxHandle_t trap_S_RegisterSound(const char* sample, bool compressed)
{
    return syscall(UI_S_REGISTERSOUND, sample, compressed);
}

void trap_Key_KeynumToStringBuf(int keynum, char* buf, int buflen)
{
    syscall(UI_KEY_KEYNUMTOSTRINGBUF, keynum, buf, buflen);
}

void trap_Key_GetBindingBuf(int keynum, char* buf, int buflen)
{
    syscall(UI_KEY_GETBINDINGBUF, keynum, buf, buflen);
}

void trap_Key_SetBinding(int keynum, const char* binding)
{
    syscall(UI_KEY_SETBINDING, keynum, binding);
}

bool trap_Key_IsDown(int keynum)
{
    return syscall(UI_KEY_ISDOWN, keynum);
}

bool trap_Key_GetOverstrikeMode(void)
{
    VMVTRACE(UI_KEY_GETOVERSTRIKEMODE);
    return syscall(UI_KEY_GETOVERSTRIKEMODE);
}

void trap_Key_SetOverstrikeMode(bool state)
{
    syscall(UI_KEY_SETOVERSTRIKEMODE, state);
}

void trap_Key_ClearStates(void)
{
    VMVTRACE(UI_KEY_CLEARSTATES);
    syscall(UI_KEY_CLEARSTATES);
}

int trap_Key_GetCatcher(void)
{
    VMVTRACE(UI_KEY_GETCATCHER);
    return syscall(UI_KEY_GETCATCHER);
}

void trap_Key_SetCatcher(int catcher)
{
    syscall(UI_KEY_SETCATCHER, catcher);
}

void trap_GetClipboardData(char* buf, int bufsize)
{
    syscall(UI_GETCLIPBOARDDATA, buf, bufsize);
}

void trap_GetClientState(uiClientState_t* state)
{
    syscall(UI_GETCLIENTSTATE, state);
}

void trap_GetGlconfig(glconfig_t* glconfig)
{
    syscall(UI_GETGLCONFIG, glconfig);
}

int trap_GetConfigString(int index, char* buff, int buffsize)
{
    return syscall(UI_GETCONFIGSTRING, index, buff, buffsize);
}

int trap_LAN_GetServerCount(int source)
{
    return syscall(UI_LAN_GETSERVERCOUNT, source);
}

void trap_LAN_GetServerAddressString(int source, int n, char* buf, int buflen)
{
    syscall(UI_LAN_GETSERVERADDRESSSTRING, source, n, buf, buflen);
}

void trap_LAN_GetServerInfo(int source, int n, char* buf, int buflen)
{
    syscall(UI_LAN_GETSERVERINFO, source, n, buf, buflen);
}

int trap_LAN_GetServerPing(int source, int n)
{
    return syscall(UI_LAN_GETSERVERPING, source, n);
}

int trap_LAN_GetPingQueueCount(void)
{
    VMVTRACE(UI_LAN_GETPINGQUEUECOUNT);
    return syscall(UI_LAN_GETPINGQUEUECOUNT);
}

int trap_LAN_ServerStatus(const char* serverAddress, char* serverStatus, int maxLen)
{
    return syscall(UI_LAN_SERVERSTATUS, serverAddress, serverStatus, maxLen);
}

void trap_LAN_SaveCachedServers(void)
{
    VMVTRACE(UI_LAN_SAVECACHEDSERVERS);
    syscall(UI_LAN_SAVECACHEDSERVERS);
}

void trap_LAN_LoadCachedServers(void)
{
    VMVTRACE(UI_LAN_LOADCACHEDSERVERS);
    syscall(UI_LAN_LOADCACHEDSERVERS);
}

void trap_LAN_ResetPings(int n)
{
    syscall(UI_LAN_RESETPINGS, n);
}

void trap_LAN_ClearPing(int n)
{
    syscall(UI_LAN_CLEARPING, n);
}

void trap_LAN_GetPing(int n, char* buf, int buflen, int* pingtime)
{
    syscall(UI_LAN_GETPING, n, buf, buflen, pingtime);
}

void trap_LAN_GetPingInfo(int n, char* buf, int buflen)
{
    syscall(UI_LAN_GETPINGINFO, n, buf, buflen);
}

void trap_LAN_MarkServerVisible(int source, int n, bool visible)
{
    syscall(UI_LAN_MARKSERVERVISIBLE, source, n, visible);
}

int trap_LAN_ServerIsVisible(int source, int n)
{
    return syscall(UI_LAN_SERVERISVISIBLE, source, n);
}

bool trap_LAN_UpdateVisiblePings(int source)
{
    return syscall(UI_LAN_UPDATEVISIBLEPINGS, source);
}

int trap_LAN_AddServer(int source, const char* name, const char* addr)
{
    return syscall(UI_LAN_ADDSERVER, source, name, addr);
}

void trap_LAN_RemoveServer(int source, const char* addr)
{
    syscall(UI_LAN_REMOVESERVER, source, addr);
}

int trap_LAN_CompareServers(int source, int sortKey, int sortDir, int s1, int s2)
{
    return syscall(UI_LAN_COMPARESERVERS, source, sortKey, sortDir, s1, s2);
}

int trap_MemoryRemaining(void)
{
    VMVTRACE(UI_MEMORY_REMAINING);
    return syscall(UI_MEMORY_REMAINING);
}

int trap_PC_LoadSource(const char* filename)
{
    return syscall(UI_PC_LOAD_SOURCE, filename);
}

int trap_PC_FreeSource(int handle)
{
    return syscall(UI_PC_FREE_SOURCE, handle);
}

int trap_PC_ReadToken(int handle, pc_token_t* pc_token)
{
    return syscall(UI_PC_READ_TOKEN, handle, pc_token);
}

int trap_PC_SourceFileAndLine(int handle, char* filename, int* line)
{
    return syscall(UI_PC_SOURCE_FILE_AND_LINE, handle, filename, line);
}

void trap_S_StopBackgroundTrack(void)
{
    VMVTRACE(UI_S_STOPBACKGROUNDTRACK);
    syscall(UI_S_STOPBACKGROUNDTRACK);
}

void trap_S_StartBackgroundTrack(const char* intro, const char* loop)
{
    syscall(UI_S_STARTBACKGROUNDTRACK, intro, loop);
}

int trap_RealTime(qtime_t* qtime)
{
    return syscall(UI_REAL_TIME, qtime);
}

// this returns a handle.  arg0 is the name in the format "idlogo.roq", set arg1 to NULL, alteredstates to false (do not alter gamestate)
int trap_CIN_PlayCinematic(const char* arg0, int xpos, int ypos, int width, int height, int bits)
{
    return syscall(UI_CIN_PLAYCINEMATIC, arg0, xpos, ypos, width, height, bits);
}

// stops playing the cinematic and ends it.  should always return FMV_EOF
// cinematics must be stopped in reverse order of when they are started
e_status trap_CIN_StopCinematic(int handle)
{
    return syscall(UI_CIN_STOPCINEMATIC, handle);
}

// will run a frame of the cinematic but will not draw it.  Will return FMV_EOF if the end of the cinematic has been reached.
e_status trap_CIN_RunCinematic(int handle)
{
    return syscall(UI_CIN_RUNCINEMATIC, handle);
}

// draws the current frame
void trap_CIN_DrawCinematic(int handle)
{
    syscall(UI_CIN_DRAWCINEMATIC, handle);
}

// allows you to resize the animation dynamically
void trap_CIN_SetExtents(int handle, int x, int y, int w, int h)
{
    syscall(UI_CIN_SETEXTENTS, handle, x, y, w, h);
}

void trap_R_RemapShader(const char* oldShader, const char* newShader, const char* timeOffset)
{
    syscall(UI_R_REMAP_SHADER, oldShader, newShader, timeOffset);
}
