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
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>
#include <limits.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdio.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <string.h>
#include <ctype.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <errno.h>
#ifdef __linux__
#include <mntent.h>
#endif
#include <dlfcn.h>

#ifdef __linux__
#include <fpu_control.h> // bk001213 - force dumps on divide by zero
#endif

// FIXME TTimo should we gard this? most *nix system should comply?
#include <termios.h>

#include "../game/q_shared.h"
#include "../qcommon/qcommon.h"
#include "../renderer/tr_public.h"

#include "linux_local.h" // bk001204

// Structure containing functions exported from refresh DLL
refexport_t re;

unsigned sys_frame_time;

uid_t saved_euid;
bool stdin_active = true;

// =======================================================================
// General routines
// =======================================================================

#ifndef DEDICATED
/*
=================
Sys_In_Restart_f

Restart the input subsystem
=================
*/
void Sys_In_Restart_f(void)
{
    IN_Shutdown();
    IN_Init();
}
#endif

// =============================================================
// general sys routines
// =============================================================

// single exit point (regular exit or in case of signal fault)
NORETURN void Sys_Exit(int ex)
{
#ifdef NDEBUG // regular behavior

    // We can't do this
    //  as long as GL DLL's keep installing with atexit...
    // exit(ex);
    _exit(ex);
#else

    // Give me a backtrace on error exits.
    assert(ex == 0);
    exit(ex);
#endif
}

NORETURN void Sys_Quit(void)
{
    CL_Shutdown();
    fcntl(0, F_SETFL, fcntl(0, F_GETFL, 0) & ~FNDELAY);
    Sys_Exit(0);
}

void Sys_Init(void)
{
#ifndef DEDICATED
    Cmd_AddCommand("in_restart", Sys_In_Restart_f);
#endif

#if defined __linux__
#if defined __i386__
    Cvar_Set("arch", "linux i386");
#else
    Cvar_Set("arch", "linux unknown");
#endif
#else
    Cvar_Set("arch", "unknown");
#endif

#ifndef DEDICATED
    IN_Init();
#endif
}

NORETURN void Sys_Error(const char* error, ...)
{
    va_list argptr;
    char string[1024];

    // change stdin to non blocking
    fcntl(0, F_SETFL, fcntl(0, F_GETFL, 0) & ~FNDELAY);

    CL_Shutdown();

    va_start(argptr, error);
    vsprintf(string, error, argptr);
    va_end(argptr);
    fprintf(stderr, "Sys_Error: %s\n", string);

    Sys_Exit(1); // bk010104 - use single exit point.
}

/*****************************************************************************/

void Sys_UnloadDll(void* dllHandle)
{
    // bk001206 - verbose error reporting
    const char* err;
    if (!dllHandle) {
        Com_Printf("Sys_UnloadDll(NULL)\n");
        return;
    }
    dlclose(dllHandle);
    err = dlerror();
    if (err != NULL)
        Com_Printf("Sys_UnloadGame failed on dlclose: \"%s\"!\n", err);
}

/*
=================
Sys_LoadDll

Used to load a development dll instead of a virtual machine
TTimo:
changed the load procedure to match VFS logic, and allow developer use
#1 look down current path
#2 look in fs_homepath
#3 look in fs_basepath
=================
*/
extern char* FS_BuildOSPath(const char* base, const char* game, const char* qpath);

void* Sys_LoadDll(const char* name, char* fqpath,
                  int (**entryPoint)(int, ...),
                  int (*systemcalls)(int, ...))
{
    void* libHandle;
    void (*dllEntry)(int (*syscallptr)(int, ...));
    char curpath[MAX_OSPATH];
    char fname[MAX_OSPATH];
    char* basepath;
    char* homepath;
    char* pwdpath;
    char* gamedir;
    char* fn;
    const char* err = NULL;

    *fqpath = 0;

    // bk001206 - let's have some paranoia
    assert(name);

    getcwd(curpath, sizeof(curpath));
#if defined __i386__
    snprintf(fname, sizeof(fname), "%si386.so", name);
#elif defined __axp__
    snprintf(fname, sizeof(fname), "%saxp.so", name);
#else
#error Unknown arch
#endif

// bk001129 - was RTLD_LAZY
#define Q_RTLD RTLD_NOW

    pwdpath = Sys_Cwd();
    basepath = Cvar_VariableString("fs_basepath");
    homepath = Cvar_VariableString("fs_homepath");
    gamedir = Cvar_VariableString("fs_game");

    // pwdpath
    fn = FS_BuildOSPath(pwdpath, gamedir, fname);
    Com_Printf("Sys_LoadDll(%s)... \n", fn);
    libHandle = dlopen(fn, Q_RTLD);

    if (!libHandle) {
        Com_Printf("Sys_LoadDll(%s) failed:\n\"%s\"\n", fn, dlerror());
        // fs_homepath
        fn = FS_BuildOSPath(homepath, gamedir, fname);
        Com_Printf("Sys_LoadDll(%s)... \n", fn);
        libHandle = dlopen(fn, Q_RTLD);

        if (!libHandle) {
            Com_Printf("Sys_LoadDll(%s) failed:\n\"%s\"\n", fn, dlerror());
            // fs_basepath
            fn = FS_BuildOSPath(basepath, gamedir, fname);
            Com_Printf("Sys_LoadDll(%s)... \n", fn);
            libHandle = dlopen(fn, Q_RTLD);

            if (!libHandle) {
#ifndef NDEBUG // bk001206 - in debug abort on failure
                Com_Error(ERR_FATAL, "Sys_LoadDll(%s) failed dlopen() completely!\n", name);
#else
                Com_Printf("Sys_LoadDll(%s) failed dlopen() completely!\n", name);
#endif
                return NULL;
            } else
                Com_Printf("Sys_LoadDll(%s): succeeded ...\n", fn);
        } else
            Com_Printf("Sys_LoadDll(%s): succeeded ...\n", fn);
    } else
        Com_Printf("Sys_LoadDll(%s): succeeded ...\n", fn);

    dllEntry = dlsym(libHandle, "dllEntry");
    *entryPoint = dlsym(libHandle, "vmMain");
    if (!*entryPoint || !dllEntry) {
        err = dlerror();
#ifndef NDEBUG // bk001206 - in debug abort on failure
        Com_Error(ERR_FATAL, "Sys_LoadDll(%s) failed dlsym(vmMain):\n\"%s\" !\n", name, err);
#else
        Com_Printf("Sys_LoadDll(%s) failed dlsym(vmMain):\n\"%s\" !\n", name, err);
#endif
        dlclose(libHandle);
        err = dlerror();
        if (err != NULL)
            Com_Printf("Sys_LoadDll(%s) failed dlcose:\n\"%s\"\n", name, err);
        return NULL;
    }
    Com_Printf("Sys_LoadDll(%s) found **vmMain** at  %p  \n", name, *entryPoint); // bk001212
    dllEntry(systemcalls);
    Com_Printf("Sys_LoadDll(%s) succeeded!\n", name);
    if (libHandle)
        Q_strncpyz(fqpath, fn, MAX_QPATH); // added 7/20/02 by T.Ray
    return libHandle;
}

/*
========================================================================

EVENT LOOP

========================================================================
*/

// bk000306: upped this from 64
#define MAX_QUED_EVENTS 256
#define MASK_QUED_EVENTS (MAX_QUED_EVENTS - 1)

sysEvent_t eventQue[MAX_QUED_EVENTS];
// bk000306: initialize
int eventHead = 0;
int eventTail = 0;
byte sys_packetReceived[MAX_MSGLEN];

/*
================
Sys_QueEvent

A time of 0 will get the current time
Ptr should either be null, or point to a block of data that can
be freed by the game later.
================
*/
void Sys_QueEvent(int time, sysEventType_t type, int value, int value2, int ptrLength, void* ptr)
{
    sysEvent_t* ev;

    ev = &eventQue[eventHead & MASK_QUED_EVENTS];

    // bk000305 - was missing
    if (eventHead - eventTail >= MAX_QUED_EVENTS) {
        Com_Printf("Sys_QueEvent: overflow\n");
        // we are discarding an event, but don't leak memory
        if (ev->evPtr) {
            Z_Free(ev->evPtr);
        }
        eventTail++;
    }

    eventHead++;

    if (time == 0) {
        time = Sys_Milliseconds();
    }

    ev->evTime = time;
    ev->evType = type;
    ev->evValue = value;
    ev->evValue2 = value2;
    ev->evPtrLength = ptrLength;
    ev->evPtr = ptr;
}

sysEvent_t Sys_GetEvent(void)
{
    sysEvent_t ev;
    char* s;
    msg_t netmsg;
    netadr_t adr;

    // return if we have data
    if (eventHead > eventTail) {
        eventTail++;
        return eventQue[(eventTail - 1) & MASK_QUED_EVENTS];
    }

    // pump the message loop
    // in vga this calls KBD_Update, under X, it calls GetEvent
    Sys_SendKeyEvents();

    // check for other input devices
    IN_Frame();

    // check for network packets
    MSG_Init(&netmsg, sys_packetReceived, sizeof(sys_packetReceived));
    if (Sys_GetPacket(&adr, &netmsg)) {
        netadr_t* buf;
        int len;

        // copy out to a separate buffer for qeueing
        len = sizeof(netadr_t) + netmsg.cursize;
        buf = Z_Malloc(len);
        *buf = adr;
        memcpy(buf + 1, netmsg.data, netmsg.cursize);
        Sys_QueEvent(0, SE_PACKET, 0, 0, len, buf);
    }

    // return if we have data
    if (eventHead > eventTail) {
        eventTail++;
        return eventQue[(eventTail - 1) & MASK_QUED_EVENTS];
    }

    // create an empty event to return

    memset(&ev, 0, sizeof(ev));
    ev.evTime = Sys_Milliseconds();

    return ev;
}

#ifndef DEDICATED
char* Sys_GetClipboardData(void)
{
    return NULL;
}
#endif

void Sys_Print(const char* msg)
{
    fputs(msg, stderr);
}

void Sys_ConfigureFPU()
{ // bk001213 - divide by zero
#ifdef __linux__
#ifdef __i386
#ifndef NDEBUG

    // bk0101022 - enable FPE's in debug mode
    static int fpu_word = _FPU_DEFAULT & ~(_FPU_MASK_ZM | _FPU_MASK_IM);
    int current = 0;
    _FPU_GETCW(current);
#else // NDEBUG
    static int fpu_word = _FPU_DEFAULT;
    _FPU_SETCW(fpu_word);
#endif // NDEBUG
#endif // __i386
#endif // __linux
}

void Sys_PrintBinVersion(const char* name)
{
    char* sep = "==============================================================";
    fprintf(stdout, "\n\n%s\n", sep);
#ifdef DEDICATED
    fprintf(stdout, "Linux Quake3 Dedicated Server\n");
#else
    fprintf(stdout, "Linux Quake3 Full Executable\n");
#endif
    fprintf(stdout, " local install: %s\n", name);
    fprintf(stdout, "%s\n\n", sep);
}

void Sys_ParseArgs(int argc, char* argv[])
{

    if (argc == 2) {
        if ((!strcmp(argv[1], "--version"))
            || (!strcmp(argv[1], "-v"))) {
            Sys_PrintBinVersion(argv[0]);
            Sys_Exit(0);
        }
    }
}

#include "../client/client.h"
extern clientStatic_t cls;

int main(int argc, char* argv[])
{
    // int 	oldtime, newtime; // bk001204 - unused
    int len, i;
    char* cmdline;
    void Sys_SetDefaultCDPath(const char* path);

    // go back to real user for config loads
    saved_euid = geteuid();
    seteuid(getuid());

    Sys_ParseArgs(argc, argv); // bk010104 - added this for support

    Sys_SetDefaultCDPath(argv[0]);

    // merge the command line, this is kinda silly
    for (len = 1, i = 1; i < argc; i++)
        len += strlen(argv[i]) + 1;
    cmdline = malloc(len);
    *cmdline = 0;
    for (i = 1; i < argc; i++) {
        if (i > 1)
            strcat(cmdline, " ");
        strcat(cmdline, argv[i]);
    }

    // bk000306 - clear queues
    memset(&eventQue[0], 0, MAX_QUED_EVENTS * sizeof(sysEvent_t));
    memset(&sys_packetReceived[0], 0, MAX_MSGLEN * sizeof(byte));

    Com_Init(cmdline);
    NET_Init();

    fcntl(0, F_SETFL, fcntl(0, F_GETFL, 0) | FNDELAY);

#ifdef DEDICATED
    // init here for dedicated, as we don't have GLimp_Init
    InitSig();
#endif

    while (1) {
#ifdef __linux__
        Sys_ConfigureFPU();
#endif
        Com_Frame();
    }
}
