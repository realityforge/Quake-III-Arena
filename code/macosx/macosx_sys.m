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
#import "../client/client.h"
#import "macosx_local.h"

#import "Q3Controller.h"
#import "dlfcn.h"

#import <AppKit/AppKit.h>
#import <IOKit/IOBSD.h>
#import <IOKit/IOKitLib.h>
#import <IOKit/storage/IOCDMedia.h>
#import <mach/mach_error.h>

#import <sys/mount.h>
#import <sys/param.h>
#import <sys/sysctl.h>
#import <sys/types.h>
#import <unistd.h>

bool stdin_active = false;

int main(int argc, const char* argv[])
{
#ifdef DEDICATED
    Q3Controller* controller;

    stdin_active = true;
    controller = [[Q3Controller alloc] init];
    [controller quakeMain];
    return 0;
#else
    return NSApplicationMain(argc, argv);
#endif
}

void Sys_UnloadDll(void* dllHandle)
{
    if (!dllHandle) {
        return;
    }
    dlclose(dllHandle);
}

/*
=================
Sys_LoadDll

Used to load a development dll instead of a virtual machine
=================
*/
extern char* FS_BuildOSPath(const char* base, const char* game, const char* qpath);

void* QDECL Sys_LoadDll(const char* name, char* fqpath, vmMainProc* entryPoint, vmDllSystemCall systemCall)
{
    void* libHandle;
    void (*dllEntry)(int (*syscallptr)(int, ...));
    NSString *bundlePath, *libraryPath;
    const char* path;

    // TTimo
    // I don't understand the search strategy here. How can the Quake3 bundle know about the location
    // of the other bundles? is that configured somewhere in XCode?
    /*
bundlePath = [[NSBundle mainBundle] pathForResource: [NSString stringWithCString: name] ofType: @"bundle"];
libraryPath = [NSString stringWithFormat: @"%@/Contents/MacOS/%s", bundlePath, name];
    */
    libraryPath = [NSString stringWithFormat:@"%s.bundle/Contents/MacOS/%s", name, name];
    if (!libraryPath)
        return NULL;

    path = [libraryPath cString];
    Com_Printf("Loading '%s'.\n", path);
    libHandle = dlopen([libraryPath cString], RTLD_LAZY);
    if (!libHandle) {
        libHandle = dlopen(name, RTLD_LAZY);
        if (!libHandle) {
            Com_Printf("Error loading dll: %s\n", dlerror());
            return NULL;
        }
    }

    dllEntry = dlsym(libHandle, "_dllEntry");
    if (!dllEntry) {
        Com_Printf("Error loading dll:  No dllEntry symbol.\n");
        dlclose(libHandle);
        return NULL;
    }

    *entryPoint = dlsym(libHandle, "_vmMain");
    if (!*entryPoint) {
        Com_Printf("Error loading dll:  No vmMain symbol.\n");
        dlclose(libHandle);
        return NULL;
    }

    dllEntry(systemCall);
    return libHandle;
}

#ifndef DEDICATED

char* Sys_GetClipboardData(void) // FIXME
{
    NSPasteboard* pasteboard;
    NSArray* pasteboardTypes;

    pasteboard = [NSPasteboard generalPasteboard];
    pasteboardTypes = [pasteboard types];
    if ([pasteboardTypes containsObject:NSStringPboardType]) {
        NSString* clipboardString;

        clipboardString = [pasteboard stringForType:NSStringPboardType];
        if (clipboardString && [clipboardString length] > 0) {
            return strdup([clipboardString cString]);
        }
    }
    return NULL;
}
#endif

/*
================
Sys_Init

The cvar and file system has been setup, so configurations are loaded
================
*/
void Sys_Init(void)
{
    NET_Init();
    Sys_InitInput();
}

void Sys_Shutdown(void)
{
    Com_Printf("----- Sys_Shutdown -----\n");
    Sys_ShutdownInput();
    Com_Printf("------------------------\n");
}

void Sys_Error(const char* error, ...)
{
    va_list argptr;
    NSString* formattedString;

    Sys_Shutdown();

    va_start(argptr, error);
    formattedString = [[NSString alloc] initWithFormat:[NSString stringWithCString:error] arguments:argptr];
    va_end(argptr);

    NSLog(@"Sys_Error: %@", formattedString);
    NSRunAlertPanel(@"Quake 3 Error", formattedString, nil, nil, nil);

    Sys_Quit();
}

void Sys_Quit(void)
{
    Sys_Shutdown();
    [NSApp terminate:nil];
}

/*
================
Sys_Print

This is called for all console output, even if the game is running
full screen and the dedicated console window is hidden.
================
*/

char* ansiColors[8] = { "\033[30m", /* ANSI Black */
    "\033[31m", /* ANSI Red */
    "\033[32m", /* ANSI Green */
    "\033[33m", /* ANSI Yellow */
    "\033[34m", /* ANSI Blue */
    "\033[36m", /* ANSI Cyan */
    "\033[35m", /* ANSI Magenta */
    "\033[37m" }; /* ANSI White */

void Sys_Print(const char* text)
{
    fputs(text, stdout);
}
