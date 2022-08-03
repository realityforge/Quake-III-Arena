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

#include <signal.h>
#include <stdlib.h>
#include <limits.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#ifndef DEDICATED
#include "SDL2/SDL.h"
#endif

#include "sys_local.h"
#include "sys_loadlib.h"
#include "../qcommon/cvar_engine.h"
#include "../qcommon/qengine.h"

static char binaryPath[MAX_OSPATH] = { 0 };
static char installPath[MAX_OSPATH] = { 0 };

void Sys_SetBinaryPath(const char* path)
{
    strncpyz(binaryPath, path, sizeof(binaryPath));
}

char* Sys_BinaryPath(void)
{
    return binaryPath;
}

void Sys_SetDefaultInstallPath(const char* path)
{
    strncpyz(installPath, path, sizeof(installPath));
}

char* Sys_DefaultInstallPath(void)
{
    if (*installPath)
        return installPath;
    else
        return Sys_Cwd();
}

#ifndef DEDICATED
/*
=================
Sys_In_Restart_f

Restart the input subsystem
=================
*/
void Sys_In_Restart_f(void)
{
    if (!SDL_WasInit(SDL_INIT_VIDEO)) {
        Com_Printf("in_restart: Cannot restart input while video is shutdown\n");
        return;
    }

    IN_Restart();
}
#endif

#ifndef DEDICATED
char* Sys_GetClipboardData(void)
{
    char* data = NULL;
    char* cliptext;

    if ((cliptext = SDL_GetClipboardText()) != NULL) {
        if (cliptext[0] != '\0') {
            size_t bufsize = strlen(cliptext) + 1;

            data = Z_Malloc(bufsize);
            strncpyz(data, cliptext, bufsize);

            // find first listed char and set to '\0'
            strtok(data, "\n\r\b");
        }
        SDL_free(cliptext);
    }
    return data;
}
#endif

/*
=================
Sys_Exit

Single exit point (regular exit or in case of error)
=================
*/
static NORETURN void Sys_Exit(int exitCode)
{
#ifndef DEDICATED
    SDL_Quit();
#endif

    NET_Shutdown();

    Sys_PlatformExit();

    exit(exitCode);
}

NORETURN void Sys_Quit(void)
{
    Sys_Exit(0);
}

void Sys_Init(void)
{
#ifndef DEDICATED
    Cmd_AddCommand("in_restart", Sys_In_Restart_f);
#endif
    Cvar_Set("arch", OS_STRING " " ARCH_STRING);
}

/*
=================
Sys_AnsiColorPrint

Transform Q3 colour codes to ANSI escape sequences
=================
*/
void Sys_AnsiColorPrint(const char* msg)
{
    static char buffer[MAXPRINTMSG];
    int length = 0;
    static int q3ToAnsi[8] = {
        30, // COLOR_BLACK
        31, // COLOR_RED
        32, // COLOR_GREEN
        33, // COLOR_YELLOW
        34, // COLOR_BLUE
        36, // COLOR_CYAN
        35, // COLOR_MAGENTA
        0 // COLOR_WHITE
    };

    while (*msg) {
        if (Q_IsColorString(msg) || *msg == '\n') {
            // First empty the buffer
            if (length > 0) {
                buffer[length] = '\0';
                fputs(buffer, stderr);
                length = 0;
            }

            if (*msg == '\n') {
                // Issue a reset and then the newline
                fputs("\033[0m\n", stderr);
                msg++;
            } else {
                // Print the color code
                Com_sprintf(buffer, sizeof(buffer), "\033[%dm",
                            q3ToAnsi[ColorIndex(*(msg + 1))]);
                fputs(buffer, stderr);
                msg += 2;
            }
        } else {
            if (length >= MAXPRINTMSG - 1)
                break;

            buffer[length] = *msg;
            length++;
            msg++;
        }
    }

    // Empty anything still left in the buffer
    if (length > 0) {
        buffer[length] = '\0';
        fputs(buffer, stderr);
    }
}

void Sys_Print(const char* msg)
{
    CON_LogWrite(msg);
    if (com_ansiColor && com_ansiColor->integer)
        Sys_AnsiColorPrint(msg);
    else
        fputs(msg, stderr);
}

NORETURN void Sys_Error(const char* error, ...)
{
    va_list argptr;
    char string[1024];

    va_start(argptr, error);
    vsnprintf(string, sizeof(string), error, argptr);
    va_end(argptr);

    Sys_ErrorDialog(string);

    Sys_Exit(3);
}

void Sys_UnloadDll(void* dllHandle)
{
    if (!dllHandle) {
        Com_Printf("Sys_UnloadDll(NULL)\n");
        return;
    }

    Sys_UnloadLibrary(dllHandle);
}

/*
=================
Sys_LoadDll

First try to load library name from system library path,
from executable path, then fs_basepath.
=================
*/

void* Sys_LoadDll(const char* name, bool useSystemLib)
{
    void* dllhandle = NULL;

    if (!Sys_DllExtension(name)) {
        Com_Printf("Refusing to attempt to load library \"%s\": Extension not allowed.\n", name);
        return NULL;
    }

    if (useSystemLib) {
        Com_Printf("Trying to load \"%s\"...\n", name);
        dllhandle = Sys_LoadLibrary(name);
    }

    if (!dllhandle) {
        const char* topDir;
        char libPath[MAX_OSPATH];
        int len;

        topDir = Sys_BinaryPath();

        if (!*topDir)
            topDir = ".";

        len = Com_sprintf(libPath, sizeof(libPath), "%s%c%s", topDir, PATH_SEP, name);
        if (len < sizeof(libPath)) {
            Com_Printf("Trying to load \"%s\" from \"%s\"...\n", name, topDir);
            dllhandle = Sys_LoadLibrary(libPath);
        } else {
            Com_Printf("Skipping trying to load \"%s\" from \"%s\", file name is too long.\n", name, topDir);
        }

        if (!dllhandle) {
            const char* basePath = Cvar_VariableString("fs_basepath");

            if (!basePath || !*basePath)
                basePath = ".";

            if (FS_FilenameCompare(topDir, basePath)) {
                len = Com_sprintf(libPath, sizeof(libPath), "%s%c%s", basePath, PATH_SEP, name);
                if (len < sizeof(libPath)) {
                    Com_Printf("Trying to load \"%s\" from \"%s\"...\n", name, basePath);
                    dllhandle = Sys_LoadLibrary(libPath);
                } else {
                    Com_Printf("Skipping trying to load \"%s\" from \"%s\", file name is too long.\n", name, basePath);
                }
            }

            if (!dllhandle)
                Com_Printf("Loading \"%s\" failed\n", name);
        }
    }

    return dllhandle;
}

/*
=================
Sys_LoadGameDll

Used to load a development dll instead of a virtual machine
=================
*/
void* Sys_LoadGameDll(const char* name, vmMainProc* entryPoint, vmDllSystemCall systemCall)
{
    void* libHandle;
    typedef void (*vmRegisterSystemCall)(vmDllSystemCall);

    vmRegisterSystemCall dllEntry;

    assert(name);

    if (!Sys_DllExtension(name)) {
        Com_Printf("Refusing to attempt to load library \"%s\": Extension not allowed.\n", name);
        return NULL;
    }

    Com_Printf("Loading DLL file: %s\n", name);
    libHandle = Sys_LoadLibrary(name);

    if (!libHandle) {
        Com_Printf("Sys_LoadGameDll(%s) failed:\n\"%s\"\n", name, Sys_LibraryError());
        return NULL;
    }

    dllEntry = (vmRegisterSystemCall)Sys_LoadFunction(libHandle, "dllEntry");
    *entryPoint = (vmMainProc)Sys_LoadFunction(libHandle, "vmMain");

    if (!*entryPoint || !dllEntry) {
        Com_Printf("Sys_LoadGameDll(%s) failed to find vmMain function:\n\"%s\" !\n", name, Sys_LibraryError());
        Sys_UnloadLibrary(libHandle);

        return NULL;
    }

    Com_Printf("Sys_LoadGameDll(%s) found vmMain function at %p\n", name, (void*)*entryPoint);
    dllEntry(systemCall);

    return libHandle;
}

void Sys_ParseArgs(int argc, char** argv)
{
    if (argc == 2) {
        if (!strcmp(argv[1], "--version") || !strcmp(argv[1], "-v")) {
#ifdef DEDICATED
            fprintf(stdout, Q3_VERSION " dedicated server\n");
#else
            fprintf(stdout, Q3_VERSION " client\n");
#endif
            Sys_Exit(0);
        }
    }
}

#ifndef DEFAULT_BASEDIR
#ifdef __APPLE__
#define DEFAULT_BASEDIR Sys_ExtractBasedir(Sys_BinaryPath())
#else
#define DEFAULT_BASEDIR Sys_BinaryPath()
#endif
#endif

NORETURN void Sys_SigHandler(int signal)
{
    static bool signalcaught = false;

    if (signalcaught) {
        fprintf(stderr, "DOUBLE SIGNAL FAULT: Received signal %d, exiting...\n",
                signal);
    } else {
        signalcaught = true;
        VM_Forced_Unload_Start();
#ifndef DEDICATED
        CL_Shutdown(va("Received signal %d", signal), true, true);
#endif
        SV_Shutdown(va("Received signal %d", signal));
        VM_Forced_Unload_Done();
    }

    if (signal == SIGTERM || signal == SIGINT)
        Sys_Exit(1);
    else
        Sys_Exit(2);
}

int main(int argc, char** argv)
{
    int i;
    char commandLine[MAX_STRING_CHARS] = { 0 };

    Sys_PlatformInit();

    // Set the initial time base
    Sys_Milliseconds();

#ifdef __APPLE__
    // This is passed if we are launched by double-clicking
    if (argc >= 2 && Q_strncmp(argv[1], "-psn", 4) == 0)
        argc = 1;
#endif

    Sys_ParseArgs(argc, argv);
    Sys_SetBinaryPath(Sys_Dirname(argv[0]));
    Sys_SetDefaultInstallPath(DEFAULT_BASEDIR);

    // Concatenate the command line for passing to Com_Init
    for (i = 1; i < argc; i++) {
        const bool containsSpaces = strchr(argv[i], ' ') != NULL;
        if (containsSpaces)
            Q_strcat(commandLine, sizeof(commandLine), "\"");

        Q_strcat(commandLine, sizeof(commandLine), argv[i]);

        if (containsSpaces)
            Q_strcat(commandLine, sizeof(commandLine), "\"");

        Q_strcat(commandLine, sizeof(commandLine), " ");
    }

    Com_Init(commandLine);
    NET_Init();

    signal(SIGILL, Sys_SigHandler);
    signal(SIGFPE, Sys_SigHandler);
    signal(SIGSEGV, Sys_SigHandler);
    signal(SIGTERM, Sys_SigHandler);
    signal(SIGINT, Sys_SigHandler);

    while (1) {
        Com_Frame();
    }

    return 0;
}
