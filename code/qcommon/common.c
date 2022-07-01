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
// common.c -- misc functions used in client and server

#include "q_shared.h"
#include "qcommon.h"
#include <setjmp.h>
#ifndef _WIN32
#include <netinet/in.h>
#include <sys/stat.h> // umask
#else
#include <winsock.h>
#endif
#include "cvar_engine.h"

int demo_protocols[] = { 67, 66, 0 };

#define MAX_NUM_ARGVS 50

#ifdef DEDICATED
#define MIN_COMHUNKMEGS 1
#else
#define MIN_COMHUNKMEGS 56
#endif
#define DEF_COMHUNKMEGS 128
#define DEF_COMZONEMEGS 24
#define DEF_COMHUNKMEGS_S XSTRING(DEF_COMHUNKMEGS)
#define DEF_COMZONEMEGS_S XSTRING(DEF_COMZONEMEGS)

jmp_buf abortframe; // an ERR_DROP occurred, exit the entire frame

static fileHandle_t logfile;
fileHandle_t com_journalFile; // events are written here
fileHandle_t com_journalDataFile; // config files are written here

cvar_t* com_speeds;
cvar_t* com_developer;
cvar_t* com_timescale;
cvar_t* com_fixedtime;
cvar_t* com_journal;
cvar_t* com_timedemo;
cvar_t* com_sv_running;
cvar_t* com_cl_running;
cvar_t* com_logfile; // 1 = buffer log, 2 = flush after each print
cvar_t* com_showtrace;
cvar_t* com_version;
cvar_t* com_buildScript; // for automated data building scripts
#ifdef CINEMATICS_INTRO
cvar_t* com_introPlayed;
#endif
cvar_t* cl_paused;
cvar_t* sv_paused;
cvar_t* cl_packetdelay;
cvar_t* sv_packetdelay;
cvar_t* com_cameraMode;
cvar_t* com_ansiColor;
cvar_t* com_gamename;
cvar_t* com_basegame;
cvar_t* com_homepath;
cvar_t* com_busyWait;
#ifndef DEDICATED
cvar_t* com_maxfps;
cvar_t* com_maxfpsUnfocused;
cvar_t* com_maxfpsMinimized;
cvar_t* com_unfocused;
cvar_t* com_minimized;
cvar_t* con_autochat;
#endif

// com_speeds times
int time_game;
int time_frontend; // renderer frontend time
int time_backend; // renderer backend time

int com_frameTime;
int com_frameNumber;

bool com_errorEntered = false;
bool com_fullyInitialized = false;
bool com_gameRestarting = false;
bool com_gameClientRestarting = false;

char com_errorMessage[MAXPRINTMSG];

void Com_WriteConfig_f(void);
void CIN_CloseAllVideos(void);

//============================================================================

static char* rd_buffer;
static int rd_buffersize;
static void (*rd_flush)(char* buffer);

void Com_BeginRedirect(char* buffer, int buffersize, void (*flush)(char*))
{
    if (!buffer || !buffersize || !flush)
        return;
    rd_buffer = buffer;
    rd_buffersize = buffersize;
    rd_flush = flush;

    *rd_buffer = 0;
}

void Com_EndRedirect()
{
    if (rd_flush) {
        rd_flush(rd_buffer);
    }

    rd_buffer = NULL;
    rd_buffersize = 0;
    rd_flush = NULL;
}

/*
=============
Com_Printf

Both client and server can use this, and it will output
to the appropriate place.

A raw string should NEVER be passed as fmt, because of "%f" type crashers.
=============
*/
void QDECL Com_Printf(const char* fmt, ...)
{
    va_list argptr;
    char msg[MAXPRINTMSG];
    static bool opening_qconsole = false;

    va_start(argptr, fmt);
    Q_vsnprintf(msg, sizeof(msg), fmt, argptr);
    va_end(argptr);

    if (rd_buffer) {
        if ((strlen(msg) + strlen(rd_buffer)) > (rd_buffersize - 1)) {
            rd_flush(rd_buffer);
            *rd_buffer = 0;
        }
        Q_strcat(rd_buffer, rd_buffersize, msg);
        // TTimo nooo .. that would defeat the purpose
        // rd_flush(rd_buffer);
        //*rd_buffer = 0;
        return;
    }

#ifndef DEDICATED
    CL_ConsolePrint(msg);
#endif

    // echo to dedicated console and early console
    Sys_Print(msg);

    // logfile
    if (com_logfile && com_logfile->integer) {
        // TTimo: only open the qconsole.log if the filesystem is in an initialized state
        //   also, avoid recursing in the qconsole.log opening (i.e. if fs_debug is on)
        if (!logfile && FS_Initialized() && !opening_qconsole) {
            struct tm* newtime;
            time_t aclock;

            opening_qconsole = true;

            time(&aclock);
            newtime = localtime(&aclock);

            logfile = FS_FOpenFileWrite("qconsole.log");

            if (logfile) {
                Com_Printf("logfile opened on %s\n", asctime(newtime));

                if (com_logfile->integer > 1) {
                    // force it to not buffer so we get valid
                    // data even if we are crashing
                    FS_ForceFlush(logfile);
                }
            } else {
                Com_Printf("Opening qconsole.log failed!\n");
                Cvar_SetValue("logfile", 0);
            }

            opening_qconsole = false;
        }
        if (logfile && FS_Initialized()) {
            FS_Write(msg, strlen(msg), logfile);
        }
    }
}

/*
================
Com_DPrintf

A Com_Printf that only shows up if the "developer" cvar is set
================
*/
void QDECL Com_DPrintf(const char* fmt, ...)
{
    va_list argptr;
    char msg[MAXPRINTMSG];

    if (!com_developer || !com_developer->integer) {
        return; // don't confuse non-developers with techie stuff...
    }

    va_start(argptr, fmt);
    Q_vsnprintf(msg, sizeof(msg), fmt, argptr);
    va_end(argptr);

    Com_Printf("%s", msg);
}

/*
=============
Com_Error

Both client and server can use this, and it will
do the appropriate thing.
=============
*/
void QDECL Com_Error(int code, const char* fmt, ...)
{
    va_list argptr;
    static int lastErrorTime;
    static int errorCount;
    int currentTime;
#ifndef DEDICATED
    bool restartClient;
#endif

    if (com_errorEntered)
        Sys_Error("recursive error after: %s", com_errorMessage);

    com_errorEntered = true;

    Cvar_Set("com_errorCode", va("%i", code));

    // when we are running automated scripts, make sure we
    // know if anything failed
    if (com_buildScript && com_buildScript->integer) {
        code = ERR_FATAL;
    }

    // if we are getting a solid stream of ERR_DROP, do an ERR_FATAL
    currentTime = Sys_Milliseconds();
    if (currentTime - lastErrorTime < 100) {
        if (++errorCount > 3) {
            code = ERR_FATAL;
        }
    } else {
        errorCount = 0;
    }
    lastErrorTime = currentTime;

    va_start(argptr, fmt);
    Q_vsnprintf(com_errorMessage, sizeof(com_errorMessage), fmt, argptr);
    va_end(argptr);

    if (code != ERR_DISCONNECT)
        Cvar_Set("com_errorMessage", com_errorMessage);

#ifndef DEDICATED
    restartClient = com_gameClientRestarting && !(com_cl_running && com_cl_running->integer);
#endif

    com_gameRestarting = false;
    com_gameClientRestarting = false;

    if (code == ERR_DISCONNECT || code == ERR_SERVERDISCONNECT) {
        VM_Forced_Unload_Start();
        SV_Shutdown("Server disconnected");
#ifndef DEDICATED
        if (restartClient) {
            CL_Init();
        }
        CL_Disconnect(true);
        CL_FlushMemory();
#endif
        VM_Forced_Unload_Done();
        // make sure we can get at our local stuff
        FS_PureServerSetLoadedPaks("", "");
        com_errorEntered = false;
        longjmp(abortframe, -1);
    } else if (code == ERR_DROP) {
        Com_Printf("********************\nERROR: %s\n********************\n", com_errorMessage);
        VM_Forced_Unload_Start();
        SV_Shutdown(va("Server crashed: %s", com_errorMessage));
#ifndef DEDICATED
        if (restartClient) {
            CL_Init();
        }
        CL_Disconnect(true);
        CL_FlushMemory();
#endif
        VM_Forced_Unload_Done();
        FS_PureServerSetLoadedPaks("", "");
        com_errorEntered = false;
        longjmp(abortframe, -1);
    } else {
        VM_Forced_Unload_Start();
#ifndef DEDICATED
        CL_Shutdown(va("Client fatal crashed: %s", com_errorMessage), true, true);
#endif
        SV_Shutdown(va("Server fatal crashed: %s", com_errorMessage));
        VM_Forced_Unload_Done();
    }

    Com_Shutdown();

    Sys_Error("%s", com_errorMessage);
}

/*
=============
Com_Quit_f

Both client and server can use this, and it will
do the appropriate things.
=============
*/
NORETURN void Com_Quit_f()
{
    // don't try to shutdown if we are in a recursive error
    char* p = Cmd_Args();
    if (!com_errorEntered) {
        // Some VMs might execute "quit" command directly,
        // which would trigger an unload of active VM error.
        // Sys_Quit will kill this process anyways, so
        // a corrupt call stack makes no difference
        VM_Forced_Unload_Start();
        SV_Shutdown(p[0] ? p : "Server quit");
#ifndef DEDICATED
        CL_Shutdown(p[0] ? p : "Client quit", true, true);
#endif
        VM_Forced_Unload_Done();
        Com_Shutdown();
        FS_Shutdown(true);
    }
    Sys_Quit();
}

/*
============================================================================

COMMAND LINE FUNCTIONS

+ characters separate the commandLine string into multiple console
command lines.

All of these are valid:

quake3 +set test blah +map test
quake3 set test blah+map test
quake3 set test blah + map test

============================================================================
*/

#define MAX_CONSOLE_LINES 32
int com_numConsoleLines;
char* com_consoleLines[MAX_CONSOLE_LINES];

/*
==================
Com_ParseCommandLine

Break it up into multiple console lines
==================
*/
void Com_ParseCommandLine(char* commandLine)
{
    int inq = 0;
    com_consoleLines[0] = commandLine;
    com_numConsoleLines = 1;

    while (*commandLine) {
        if (*commandLine == '"') {
            inq = !inq;
        }
        // look for a + separating character
        // if commandLine came from a file, we might have real line separators
        if ((*commandLine == '+' && !inq) || *commandLine == '\n' || *commandLine == '\r') {
            if (com_numConsoleLines == MAX_CONSOLE_LINES) {
                return;
            }
            com_consoleLines[com_numConsoleLines] = commandLine + 1;
            com_numConsoleLines++;
            *commandLine = 0;
        }
        commandLine++;
    }
}

/*
===================
Com_SafeMode

Check for "safe" on the command line, which will
skip loading of q3config.cfg
===================
*/
bool Com_SafeMode()
{
    int i;

    for (i = 0; i < com_numConsoleLines; i++) {
        Cmd_TokenizeString(com_consoleLines[i]);
        if (!Q_stricmp(Cmd_Argv(0), "safe")
            || !Q_stricmp(Cmd_Argv(0), "cvar_restart")) {
            com_consoleLines[i][0] = 0;
            return true;
        }
    }
    return false;
}

/*
===============
Com_StartupVariable

Searches for command line parameters that are set commands.
If match is not NULL, only that cvar will be looked for.
That is necessary because basedir needs to be set
before the filesystem is started, but all other sets should
be after execing the config and default.
===============
*/
void Com_StartupVariable(const char* match)
{
    int i;
    char* s;

    for (i = 0; i < com_numConsoleLines; i++) {
        Cmd_TokenizeString(com_consoleLines[i]);
        if (strcmp(Cmd_Argv(0), "set")) {
            continue;
        }

        s = Cmd_Argv(1);

        if (!match || !strcmp(s, match)) {
            if (Cvar_Flags(s) == CVAR_NONEXISTENT)
                Cvar_Get(s, Cmd_ArgsFrom(2), CVAR_USER_CREATED);
            else
                Cvar_Set2(s, Cmd_ArgsFrom(2), false);
        }
    }
}

/*
=================
Com_AddStartupCommands

Adds command line parameters as script statements
Commands are separated by + signs

Returns true if any late commands were added, which
will keep the demoloop from immediately starting
=================
*/
bool Com_AddStartupCommands()
{
    int i;
    bool added;

    added = false;
    // quote every token, so args with semicolons can work
    for (i = 0; i < com_numConsoleLines; i++) {
        if (!com_consoleLines[i] || !com_consoleLines[i][0]) {
            continue;
        }

        // set commands already added with Com_StartupVariable
        if (!Q_stricmpn(com_consoleLines[i], "set ", 4)) {
            continue;
        }

        added = true;
        Cbuf_AddText(com_consoleLines[i]);
        Cbuf_AddText("\n");
    }

    return added;
}

//============================================================================

void Info_Print(const char* s)
{
    char key[BIG_INFO_KEY];
    char value[BIG_INFO_VALUE];
    char* o;
    int l;

    if (*s == '\\')
        s++;
    while (*s) {
        o = key;
        while (*s && *s != '\\')
            *o++ = *s++;

        l = o - key;
        if (l < 20) {
            memset(o, ' ', 20 - l);
            key[20] = 0;
        } else
            *o = 0;
        Com_Printf("%s ", key);

        if (!*s) {
            Com_Printf("MISSING VALUE\n");
            return;
        }

        o = value;
        s++;
        while (*s && *s != '\\')
            *o++ = *s++;
        *o = 0;

        if (*s)
            s++;
        Com_Printf("%s\n", value);
    }
}

const char* Com_StringContains(const char* str1, const char* str2, int casesensitive)
{
    const size_t len = strlen(str1) - strlen(str2);
    for (int i = 0; i <= len; i++, str1++) {
        int j;
        for (j = 0; str2[j]; j++) {
            if (casesensitive) {
                if (str1[j] != str2[j]) {
                    break;
                }
            } else {
                if (toupper(str1[j]) != toupper(str2[j])) {
                    break;
                }
            }
        }
        if (!str2[j]) {
            return str1;
        }
    }
    return NULL;
}

int Com_Filter(const char* filter, const char* name, int casesensitive)
{
    char buf[MAX_TOKEN_CHARS];
    const char* ptr;
    int i, found;

    while (*filter) {
        if (*filter == '*') {
            filter++;
            for (i = 0; *filter; i++) {
                if (*filter == '*' || *filter == '?')
                    break;
                buf[i] = *filter;
                filter++;
            }
            buf[i] = '\0';
            if (strlen(buf)) {
                ptr = Com_StringContains(name, buf, casesensitive);
                if (!ptr)
                    return false;
                name = ptr + strlen(buf);
            }
        } else if (*filter == '?') {
            filter++;
            name++;
        } else if (*filter == '[' && *(filter + 1) == '[') {
            filter++;
        } else if (*filter == '[') {
            filter++;
            found = false;
            while (*filter && !found) {
                if (*filter == ']' && *(filter + 1) != ']')
                    break;
                if (*(filter + 1) == '-' && *(filter + 2) && (*(filter + 2) != ']' || *(filter + 3) == ']')) {
                    if (casesensitive) {
                        if (*name >= *filter && *name <= *(filter + 2))
                            found = true;
                    } else {
                        if (toupper(*name) >= toupper(*filter) && toupper(*name) <= toupper(*(filter + 2)))
                            found = true;
                    }
                    filter += 3;
                } else {
                    if (casesensitive) {
                        if (*filter == *name)
                            found = true;
                    } else {
                        if (toupper(*filter) == toupper(*name))
                            found = true;
                    }
                    filter++;
                }
            }
            if (!found)
                return false;
            while (*filter) {
                if (*filter == ']' && *(filter + 1) != ']')
                    break;
                filter++;
            }
            filter++;
            name++;
        } else {
            if (casesensitive) {
                if (*filter != *name)
                    return false;
            } else {
                if (toupper(*filter) != toupper(*name))
                    return false;
            }
            filter++;
            name++;
        }
    }
    return true;
}

int Com_FilterPath(const char* filter, const char* name, int casesensitive)
{
    int i;
    char new_filter[MAX_QPATH];
    char new_name[MAX_QPATH];

    for (i = 0; i < MAX_QPATH - 1 && filter[i]; i++) {
        if (filter[i] == '\\' || filter[i] == ':') {
            new_filter[i] = '/';
        } else {
            new_filter[i] = filter[i];
        }
    }
    new_filter[i] = '\0';
    for (i = 0; i < MAX_QPATH - 1 && name[i]; i++) {
        if (name[i] == '\\' || name[i] == ':') {
            new_name[i] = '/';
        } else {
            new_name[i] = name[i];
        }
    }
    new_name[i] = '\0';
    return Com_Filter(new_filter, new_name, casesensitive);
}

int Com_RealTime(qtime_t* qtime)
{
    time_t t;
    struct tm* tms;

    t = time(NULL);
    if (!qtime)
        return t;
    tms = localtime(&t);
    if (tms) {
        qtime->tm_sec = tms->tm_sec;
        qtime->tm_min = tms->tm_min;
        qtime->tm_hour = tms->tm_hour;
        qtime->tm_mday = tms->tm_mday;
        qtime->tm_mon = tms->tm_mon;
        qtime->tm_year = tms->tm_year;
    }
    return t;
}

/*
==============================================================================

                                                ZONE MEMORY ALLOCATION

There is never any space between memblocks, and there will never be two
contiguous free memblocks.

The rover can be left pointing at a non-empty block

The zone calls are pretty much only used for small strings and structures,
all big things are allocated on the hunk.
==============================================================================
*/

#define ZONEID 0x1d4a11
#define MINFRAGMENT 64

typedef struct zonedebug_s {
    char* label;
    char* file;
    int line;
    int allocSize;
} zonedebug_t;

typedef struct memblock_s {
    int size; // including the header and possibly tiny fragments
    int tag; // a tag of 0 is a free block
    struct memblock_s *next, *prev;
    int id; // should be ZONEID
#ifdef ZONE_DEBUG
    zonedebug_t d;
#endif
} memblock_t;

typedef struct {
    int size; // total bytes malloced, including header
    int used; // total bytes used
    memblock_t blocklist; // start / end cap for linked list
    memblock_t* rover;
} memzone_t;

// main zone for all "dynamic" memory allocation
static memzone_t* mainzone;
// we also have a small zone for small allocations that would only
// fragment the main zone (think of cvar and cmd strings)
static memzone_t* smallzone;

static void Z_CheckHeap(void);

static void Z_ClearZone(memzone_t* zone, int size)
{
    memblock_t* block;

    // set the entire zone to one free block

    zone->blocklist.next = zone->blocklist.prev = block = (memblock_t*)((uint8_t*)zone + sizeof(memzone_t));
    zone->blocklist.tag = 1; // in use block
    zone->blocklist.id = 0;
    zone->blocklist.size = 0;
    zone->rover = block;
    zone->size = size;
    zone->used = 0;

    block->prev = block->next = &zone->blocklist;
    block->tag = 0; // free block
    block->id = ZONEID;
    block->size = size - sizeof(memzone_t);
}

static int Z_AvailableZoneMemory(memzone_t* zone)
{
    return zone->size - zone->used;
}

int Z_AvailableMemory()
{
    return Z_AvailableZoneMemory(mainzone);
}

void Z_Free(void* ptr)
{
    memblock_t *block, *other;
    memzone_t* zone;

    if (!ptr) {
        Com_Error(ERR_DROP, "Z_Free: NULL pointer");
    }

    block = (memblock_t*)((uint8_t*)ptr - sizeof(memblock_t));
    if (block->id != ZONEID) {
        Com_Error(ERR_FATAL, "Z_Free: freed a pointer without ZONEID");
    }
    if (block->tag == 0) {
        Com_Error(ERR_FATAL, "Z_Free: freed a freed pointer");
    }
    // if static memory
    if (block->tag == TAG_STATIC) {
        return;
    }

    // check the memory trash tester
    if (*(int*)((uint8_t*)block + block->size - 4) != ZONEID) {
        Com_Error(ERR_FATAL, "Z_Free: memory block wrote past end");
    }

    if (block->tag == TAG_SMALL) {
        zone = smallzone;
    } else {
        zone = mainzone;
    }

    zone->used -= block->size;
    // set the block to something that should cause problems
    // if it is referenced...
    memset(ptr, 0xaa, block->size - sizeof(*block));

    block->tag = 0; // mark as free

    other = block->prev;
    if (!other->tag) {
        // merge with previous free block
        other->size += block->size;
        other->next = block->next;
        other->next->prev = other;
        if (block == zone->rover) {
            zone->rover = other;
        }
        block = other;
    }

    zone->rover = block;

    other = block->next;
    if (!other->tag) {
        // merge the next free block onto the end
        block->size += other->size;
        block->next = other->next;
        block->next->prev = block;
    }
}

#ifdef ZONE_DEBUG
void* Z_TagMallocDebug(size_t size, int tag, char* label, char* file, int line)
{
    int allocSize;
#else
void* Z_TagMalloc(size_t size, int tag)
{
#endif
    int extra;
    memblock_t *start, *rover, *new, *base;
    memzone_t* zone;

    if (!tag) {
        Com_Error(ERR_FATAL, "Z_TagMalloc: tried to use a 0 tag");
    }

    if (tag == TAG_SMALL) {
        zone = smallzone;
    } else {
        zone = mainzone;
    }

#ifdef ZONE_DEBUG
    allocSize = size;
#endif
    // scan through the block list looking for the first free block
    // of sufficient size
    size += sizeof(memblock_t); // account for size of block header
    size += 4; // space for memory trash tester
    size = PAD(size, sizeof(intptr_t)); // align to 32/64 bit boundary

    base = rover = zone->rover;
    start = base->prev;

    do {
        if (rover == start) {
            // scanned all the way around the list
#ifdef ZONE_DEBUG
            Z_LogHeap();

            Com_Error(ERR_FATAL, "Z_Malloc: failed on allocation of %zuz bytes from the %s zone: %s, line: %d (%s)",
                      size, zone == smallzone ? "small" : "main", file, line, label);
#else
            Com_Error(ERR_FATAL, "Z_Malloc: failed on allocation of %lu bytes from the %s zone",
                      size, zone == smallzone ? "small" : "main");
#endif
            return NULL;
        }
        if (rover->tag) {
            base = rover = rover->next;
        } else {
            rover = rover->next;
        }
    } while (base->tag || base->size < size);

    // found a block big enough
    extra = base->size - size;
    if (extra > MINFRAGMENT) {
        // there will be a free fragment after the allocated block
        new = (memblock_t*)((uint8_t*)base + size);
        new->size = extra;
        new->tag = 0; // free block
        new->prev = base;
        new->id = ZONEID;
        new->next = base->next;
        new->next->prev = new;
        base->next = new;
        base->size = size;
    }

    base->tag = tag; // no longer a free block

    zone->rover = base->next; // next allocation will start looking here
    zone->used += base->size; //

    base->id = ZONEID;

#ifdef ZONE_DEBUG
    base->d.label = label;
    base->d.file = file;
    base->d.line = line;
    base->d.allocSize = allocSize;
#endif

    // marker for memory trash testing
    *(int*)((uint8_t*)base + base->size - 4) = ZONEID;

    return (void*)((uint8_t*)base + sizeof(memblock_t));
}

#ifdef ZONE_DEBUG
void* Z_MallocDebug(const size_t size, char* label, char* file, int line)
{
#else
void* Z_Malloc(const size_t size)
{
#endif
    void* buf;

    // Z_CheckHeap ();	// DEBUG

#ifdef ZONE_DEBUG
    buf = Z_TagMallocDebug(size, TAG_GENERAL, label, file, line);
#else
    buf = Z_TagMalloc(size, TAG_GENERAL);
#endif
    memset(buf, 0, size);

    return buf;
}

#ifdef ZONE_DEBUG
void* S_MallocDebug(const size_t size, char* label, char* file, int line)
{
    return Z_TagMallocDebug(size, TAG_SMALL, label, file, line);
}
#else
void* S_Malloc(const size_t size)
{
    return Z_TagMalloc(size, TAG_SMALL);
}
#endif

static void Z_CheckHeap()
{
    memblock_t* block;

    for (block = mainzone->blocklist.next;; block = block->next) {
        if (block->next == &mainzone->blocklist) {
            break; // all blocks have been hit
        }
        if ((uint8_t*)block + block->size != (uint8_t*)block->next)
            Com_Error(ERR_FATAL, "Z_CheckHeap: block size does not touch the next block");
        if (block->next->prev != block) {
            Com_Error(ERR_FATAL, "Z_CheckHeap: next block doesn't have proper back link");
        }
        if (!block->tag && !block->next->tag) {
            Com_Error(ERR_FATAL, "Z_CheckHeap: two consecutive free blocks");
        }
    }
}

void Z_LogZoneHeap(memzone_t* zone, char* name)
{
#ifdef ZONE_DEBUG
    char dump[32], *ptr;
    int i, j;
#endif
    memblock_t* block;
    char buf[4096];
    int size, allocSize, numBlocks;

    if (!logfile || !FS_Initialized())
        return;
    size = numBlocks = 0;
#ifdef ZONE_DEBUG
    allocSize = 0;
#endif
    Com_sprintf(buf, sizeof(buf), "\r\n================\r\n%s log\r\n================\r\n", name);
    FS_Write(buf, strlen(buf), logfile);
    for (block = zone->blocklist.next; block->next != &zone->blocklist; block = block->next) {
        if (block->tag) {
#ifdef ZONE_DEBUG
            ptr = ((char*)block) + sizeof(memblock_t);
            j = 0;
            for (i = 0; i < 20 && i < block->d.allocSize; i++) {
                if (ptr[i] >= 32 && ptr[i] < 127) {
                    dump[j++] = ptr[i];
                } else {
                    dump[j++] = '_';
                }
            }
            dump[j] = '\0';
            Com_sprintf(buf, sizeof(buf), "size = %8d: %s, line: %d (%s) [%s]\r\n", block->d.allocSize, block->d.file, block->d.line, block->d.label, dump);
            FS_Write(buf, strlen(buf), logfile);
            allocSize += block->d.allocSize;
#endif
            size += block->size;
            numBlocks++;
        }
    }
#ifdef ZONE_DEBUG
    // subtract debug memory
    size -= numBlocks * sizeof(zonedebug_t);
#else
    allocSize = numBlocks * sizeof(memblock_t); // + 32 bit alignment
#endif
    Com_sprintf(buf, sizeof(buf), "%d %s memory in %d blocks\r\n", size, name, numBlocks);
    FS_Write(buf, strlen(buf), logfile);
    Com_sprintf(buf, sizeof(buf), "%d %s memory overhead\r\n", size - allocSize, name);
    FS_Write(buf, strlen(buf), logfile);
}

void Z_LogHeap()
{
    Z_LogZoneHeap(mainzone, "MAIN");
    Z_LogZoneHeap(smallzone, "SMALL");
}

// static mem blocks to reduce a lot of small zone overhead
typedef struct memstatic_s {
    memblock_t b;
    uint8_t mem[2];
} memstatic_t;

memstatic_t emptystring = { { (sizeof(memblock_t) + 2 + 3) & ~3, TAG_STATIC, NULL, NULL, ZONEID }, { '\0', '\0' } };
memstatic_t numberstring[] = {
    { { (sizeof(memstatic_t) + 3) & ~3, TAG_STATIC, NULL, NULL, ZONEID }, { '0', '\0' } },
    { { (sizeof(memstatic_t) + 3) & ~3, TAG_STATIC, NULL, NULL, ZONEID }, { '1', '\0' } },
    { { (sizeof(memstatic_t) + 3) & ~3, TAG_STATIC, NULL, NULL, ZONEID }, { '2', '\0' } },
    { { (sizeof(memstatic_t) + 3) & ~3, TAG_STATIC, NULL, NULL, ZONEID }, { '3', '\0' } },
    { { (sizeof(memstatic_t) + 3) & ~3, TAG_STATIC, NULL, NULL, ZONEID }, { '4', '\0' } },
    { { (sizeof(memstatic_t) + 3) & ~3, TAG_STATIC, NULL, NULL, ZONEID }, { '5', '\0' } },
    { { (sizeof(memstatic_t) + 3) & ~3, TAG_STATIC, NULL, NULL, ZONEID }, { '6', '\0' } },
    { { (sizeof(memstatic_t) + 3) & ~3, TAG_STATIC, NULL, NULL, ZONEID }, { '7', '\0' } },
    { { (sizeof(memstatic_t) + 3) & ~3, TAG_STATIC, NULL, NULL, ZONEID }, { '8', '\0' } },
    { { (sizeof(memstatic_t) + 3) & ~3, TAG_STATIC, NULL, NULL, ZONEID }, { '9', '\0' } }
};

/*
========================
CopyString

 NOTE:	never write over the memory CopyString returns because
                memory from a memstatic_t might be returned
========================
*/
char* CopyString(const char* in)
{
    char* out;

    if (!in[0]) {
        return ((char*)&emptystring) + sizeof(memblock_t);
    } else if (!in[1]) {
        if (in[0] >= '0' && in[0] <= '9') {
            return ((char*)&numberstring[in[0] - '0']) + sizeof(memblock_t);
        }
    }
    out = S_Malloc(strlen(in) + 1);
    strcpy(out, in);
    return out;
}

/*
==============================================================================

Goals:
        reproducible without history effects -- no out of memory errors on weird map to map changes
        allow restarting of the client without fragmentation
        minimize total pages in use at run time
        minimize total pages needed during load time

  Single block of memory with stack allocators coming from both ends towards the middle.

  One side is designated the temporary memory allocator.

  Temporary memory can be allocated and freed in any order.

  A highwater mark is kept of the most in use at any time.

  When there is no temporary memory allocated, the permanent and temp sides
  can be switched, allowing the already touched temp memory to be used for
  permanent storage.

  Temp memory must never be allocated on two ends at once, or fragmentation
  could occur.

  If we have any in-use temp memory, additional temp allocations must come from
  that side.

  If not, we can choose to make either side the new temp side and push future
  permanent allocations to the other side.  Permanent allocations should be
  kept on the side that has the current greatest wasted highwater mark.

==============================================================================
*/

#define HUNK_MAGIC 0x89537892
#define HUNK_FREE_MAGIC 0x89537893

typedef struct {
    int magic;
    int size;
} hunkHeader_t;

typedef struct {
    int mark;
    int permanent;
    int temp;
    int tempHighwater;
} hunkUsed_t;

typedef struct hunkblock_s {
    int size;
    uint8_t printed;
    struct hunkblock_s* next;
    char* label;
    char* file;
    int line;
} hunkblock_t;

static hunkblock_t* hunkblocks;

static hunkUsed_t hunk_low, hunk_high;
static hunkUsed_t *hunk_permanent, *hunk_temp;

static uint8_t* s_hunkData = NULL;
static int s_hunkTotal;

static int s_zoneTotal;
static int s_smallZoneTotal;

void Com_Meminfo_f()
{
    memblock_t* block;
    int zoneBytes, zoneBlocks;
    int smallZoneBytes;
    int botlibBytes, rendererBytes;
    int unused;

    zoneBytes = 0;
    botlibBytes = 0;
    rendererBytes = 0;
    zoneBlocks = 0;
    for (block = mainzone->blocklist.next;; block = block->next) {
        if (Cmd_Argc() != 1) {
            Com_Printf("block:%p    size:%7i    tag:%3i\n",
                       (void*)block, block->size, block->tag);
        }
        if (block->tag) {
            zoneBytes += block->size;
            zoneBlocks++;
            if (block->tag == TAG_BOTLIB) {
                botlibBytes += block->size;
            } else if (block->tag == TAG_RENDERER) {
                rendererBytes += block->size;
            }
        }

        if (block->next == &mainzone->blocklist) {
            break; // all blocks have been hit
        }
        if ((uint8_t*)block + block->size != (uint8_t*)block->next) {
            Com_Printf("ERROR: block size does not touch the next block\n");
        }
        if (block->next->prev != block) {
            Com_Printf("ERROR: next block doesn't have proper back link\n");
        }
        if (!block->tag && !block->next->tag) {
            Com_Printf("ERROR: two consecutive free blocks\n");
        }
    }

    smallZoneBytes = 0;
    for (block = smallzone->blocklist.next;; block = block->next) {
        if (block->tag) {
            smallZoneBytes += block->size;
        }

        if (block->next == &smallzone->blocklist) {
            break; // all blocks have been hit
        }
    }

    Com_Printf("%8i bytes total hunk\n", s_hunkTotal);
    Com_Printf("%8i bytes total zone\n", s_zoneTotal);
    Com_Printf("\n");
    Com_Printf("%8i low mark\n", hunk_low.mark);
    Com_Printf("%8i low permanent\n", hunk_low.permanent);
    if (hunk_low.temp != hunk_low.permanent) {
        Com_Printf("%8i low temp\n", hunk_low.temp);
    }
    Com_Printf("%8i low tempHighwater\n", hunk_low.tempHighwater);
    Com_Printf("\n");
    Com_Printf("%8i high mark\n", hunk_high.mark);
    Com_Printf("%8i high permanent\n", hunk_high.permanent);
    if (hunk_high.temp != hunk_high.permanent) {
        Com_Printf("%8i high temp\n", hunk_high.temp);
    }
    Com_Printf("%8i high tempHighwater\n", hunk_high.tempHighwater);
    Com_Printf("\n");
    Com_Printf("%8i total hunk in use\n", hunk_low.permanent + hunk_high.permanent);
    unused = 0;
    if (hunk_low.tempHighwater > hunk_low.permanent) {
        unused += hunk_low.tempHighwater - hunk_low.permanent;
    }
    if (hunk_high.tempHighwater > hunk_high.permanent) {
        unused += hunk_high.tempHighwater - hunk_high.permanent;
    }
    Com_Printf("%8i unused highwater\n", unused);
    Com_Printf("\n");
    Com_Printf("%8i bytes in %i zone blocks\n", zoneBytes, zoneBlocks);
    Com_Printf("        %8i bytes in dynamic botlib\n", botlibBytes);
    Com_Printf("        %8i bytes in dynamic renderer\n", rendererBytes);
    Com_Printf("        %8i bytes in dynamic other\n", zoneBytes - (botlibBytes + rendererBytes));
    Com_Printf("        %8i bytes in small Zone memory\n", smallZoneBytes);
}

/*
===============
Com_TouchMemory

Touch all known used data to make sure it is paged in
===============
*/
void Com_TouchMemory()
{
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
    int start, end;
    int i, j;
    unsigned sum;
    memblock_t* block;

    Z_CheckHeap();

    start = Sys_Milliseconds();

    sum = 0;

    j = hunk_low.permanent >> 2;
    for (i = 0; i < j; i += 64) { // only need to touch each page
        sum += ((int*)s_hunkData)[i];
    }

    i = (s_hunkTotal - hunk_high.permanent) >> 2;
    j = hunk_high.permanent >> 2;
    for (; i < j; i += 64) { // only need to touch each page
        sum += ((int*)s_hunkData)[i];
    }

    for (block = mainzone->blocklist.next;; block = block->next) {
        if (block->tag) {
            j = block->size >> 2;
            for (i = 0; i < j; i += 64) { // only need to touch each page
                sum += ((int*)block)[i];
            }
        }
        if (block->next == &mainzone->blocklist) {
            break; // all blocks have been hit
        }
    }

    end = Sys_Milliseconds();

    Com_Printf("Com_TouchMemory: %i msec\n", end - start);
#pragma GCC diagnostic pop
}

void Com_InitSmallZoneMemory()
{
    s_smallZoneTotal = 512 * 1024;
    smallzone = calloc(s_smallZoneTotal, 1);
    if (!smallzone) {
        Com_Error(ERR_FATAL, "Small zone data failed to allocate %1.1f megs", (float)s_smallZoneTotal / (1024 * 1024));
    }
    Z_ClearZone(smallzone, s_smallZoneTotal);
}

void Com_InitZoneMemory()
{
    cvar_t* cv;

    // Please note: com_zoneMegs can only be set on the command line, and
    // not in q3config.cfg or Com_StartupVariable, as they haven't been
    // executed by this point. It's a chicken and egg problem. We need the
    // memory manager configured to handle those places where you would
    // configure the memory manager.

    // allocate the random block zone
    cv = Cvar_Get("com_zoneMegs", DEF_COMZONEMEGS_S, CVAR_LATCH | CVAR_ARCHIVE);

    if (cv->integer < DEF_COMZONEMEGS) {
        s_zoneTotal = 1024 * 1024 * DEF_COMZONEMEGS;
    } else {
        s_zoneTotal = cv->integer * 1024 * 1024;
    }

    mainzone = calloc(s_zoneTotal, 1);
    if (!mainzone) {
        Com_Error(ERR_FATAL, "Zone data failed to allocate %i megs", s_zoneTotal / (1024 * 1024));
    }
    Z_ClearZone(mainzone, s_zoneTotal);
}

void Hunk_Log()
{
    hunkblock_t* block;
    char buf[4096];
    int size, numBlocks;

    if (!logfile || !FS_Initialized())
        return;
    size = 0;
    numBlocks = 0;
    Com_sprintf(buf, sizeof(buf), "\r\n================\r\nHunk log\r\n================\r\n");
    FS_Write(buf, strlen(buf), logfile);
    for (block = hunkblocks; block; block = block->next) {
#ifdef HUNK_DEBUG
        Com_sprintf(buf, sizeof(buf), "size = %8d: %s, line: %d (%s)\r\n", block->size, block->file, block->line, block->label);
        FS_Write(buf, strlen(buf), logfile);
#endif
        size += block->size;
        numBlocks++;
    }
    Com_sprintf(buf, sizeof(buf), "%d Hunk memory\r\n", size);
    FS_Write(buf, strlen(buf), logfile);
    Com_sprintf(buf, sizeof(buf), "%d hunk blocks\r\n", numBlocks);
    FS_Write(buf, strlen(buf), logfile);
}

void Hunk_SmallLog()
{
    hunkblock_t *block, *block2;
    char buf[4096];
    int size, numBlocks;
#ifdef HUNK_DEBUG
    int locsize;
#endif

    if (!logfile || !FS_Initialized())
        return;
    for (block = hunkblocks; block; block = block->next) {
        block->printed = false;
    }
    size = 0;
    numBlocks = 0;
    Com_sprintf(buf, sizeof(buf), "\r\n================\r\nHunk Small log\r\n================\r\n");
    FS_Write(buf, strlen(buf), logfile);
    for (block = hunkblocks; block; block = block->next) {
        if (block->printed) {
            continue;
        }
#ifdef HUNK_DEBUG
        locsize = block->size;
#endif
        for (block2 = block->next; block2; block2 = block2->next) {
            if (block->line != block2->line) {
                continue;
            }
            if (Q_stricmp(block->file, block2->file)) {
                continue;
            }
            size += block2->size;
#ifdef HUNK_DEBUG
            locsize += block2->size;
#endif
            block2->printed = true;
        }
#ifdef HUNK_DEBUG
        Com_sprintf(buf, sizeof(buf), "size = %8d: %s, line: %d (%s)\r\n", locsize, block->file, block->line, block->label);
        FS_Write(buf, strlen(buf), logfile);
#endif
        size += block->size;
        numBlocks++;
    }
    Com_sprintf(buf, sizeof(buf), "%d Hunk memory\r\n", size);
    FS_Write(buf, strlen(buf), logfile);
    Com_sprintf(buf, sizeof(buf), "%d hunk blocks\r\n", numBlocks);
    FS_Write(buf, strlen(buf), logfile);
}

void Com_InitHunkMemory()
{
    cvar_t* cv;
    int nMinAlloc;
    char* pMsg = NULL;

    // make sure the file system has allocated and "not" freed any temp blocks
    // this allows the config and product id files ( journal files too ) to be loaded
    // by the file system without redundant routines in the file system utilizing different
    // memory systems
    if (FS_LoadStack() != 0) {
        Com_Error(ERR_FATAL, "Hunk initialization failed. File system load stack not zero");
    }

    // allocate the stack based hunk allocator
    cv = Cvar_Get("com_hunkMegs", DEF_COMHUNKMEGS_S, CVAR_LATCH | CVAR_ARCHIVE);
    Cvar_SetDescription(cv, "The size of the hunk memory segment");

    nMinAlloc = MIN_COMHUNKMEGS;
    pMsg = "Minimum com_hunkMegs is %i, allocating %i megs.\n";

    if (cv->integer < nMinAlloc) {
        s_hunkTotal = 1024 * 1024 * nMinAlloc;
        Com_Printf(pMsg, nMinAlloc, s_hunkTotal / (1024 * 1024));
    } else {
        s_hunkTotal = cv->integer * 1024 * 1024;
    }

    s_hunkData = calloc(s_hunkTotal + 31, 1);
    if (!s_hunkData) {
        Com_Error(ERR_FATAL, "Hunk data failed to allocate %i megs", s_hunkTotal / (1024 * 1024));
    }
    // cacheline align
    s_hunkData = (uint8_t*)(((intptr_t)s_hunkData + 31) & ~31);
    Hunk_Clear();

    Cmd_AddCommand("meminfo", Com_Meminfo_f);
#ifdef ZONE_DEBUG
    Cmd_AddCommand("zonelog", Z_LogHeap);
#endif
#ifdef HUNK_DEBUG
    Cmd_AddCommand("hunklog", Hunk_Log);
    Cmd_AddCommand("hunksmalllog", Hunk_SmallLog);
#endif
}

int Hunk_MemoryRemaining()
{
    int low, high;

    low = hunk_low.permanent > hunk_low.temp ? hunk_low.permanent : hunk_low.temp;
    high = hunk_high.permanent > hunk_high.temp ? hunk_high.permanent : hunk_high.temp;

    return s_hunkTotal - (low + high);
}

/*
===================
Hunk_SetMark

The server calls this after the level and game VM have been loaded
===================
*/
void Hunk_SetMark()
{
    hunk_low.mark = hunk_low.permanent;
    hunk_high.mark = hunk_high.permanent;
}

/*
=================
Hunk_ClearToMark

The client calls this before starting a vid_restart or snd_restart
=================
*/
void Hunk_ClearToMark()
{
    hunk_low.permanent = hunk_low.temp = hunk_low.mark;
    hunk_high.permanent = hunk_high.temp = hunk_high.mark;
}

bool Hunk_CheckMark()
{
    if (hunk_low.mark || hunk_high.mark) {
        return true;
    }
    return false;
}

void CL_ShutdownCGame(void);
void CL_ShutdownUI(void);
void SV_ShutdownGameProgs(void);

/*
=================
Hunk_Clear

The server calls this before shutting down or loading a new map
=================
*/
void Hunk_Clear()
{

#ifndef DEDICATED
    CL_ShutdownCGame();
    CL_ShutdownUI();
#endif
    SV_ShutdownGameProgs();
#ifndef DEDICATED
    CIN_CloseAllVideos();
#endif
    hunk_low.mark = 0;
    hunk_low.permanent = 0;
    hunk_low.temp = 0;
    hunk_low.tempHighwater = 0;

    hunk_high.mark = 0;
    hunk_high.permanent = 0;
    hunk_high.temp = 0;
    hunk_high.tempHighwater = 0;

    hunk_permanent = &hunk_low;
    hunk_temp = &hunk_high;

    Com_Printf("Hunk_Clear: reset the hunk ok\n");
    VM_Clear();
#ifdef HUNK_DEBUG
    hunkblocks = NULL;
#endif
}

static void Hunk_SwapBanks()
{
    hunkUsed_t* swap;

    // can't swap banks if there is any temp already allocated
    if (hunk_temp->temp != hunk_temp->permanent) {
        return;
    }

    // if we have a larger highwater mark on this side, start making
    // our permanent allocations here and use the other side for temp
    if (hunk_temp->tempHighwater - hunk_temp->permanent > hunk_permanent->tempHighwater - hunk_permanent->permanent) {
        swap = hunk_temp;
        hunk_temp = hunk_permanent;
        hunk_permanent = swap;
    }
}

/*
=================
Hunk_Alloc

Allocate permanent (until the hunk is cleared) memory
=================
*/
#ifdef HUNK_DEBUG
void* Hunk_AllocDebug(int size, ha_pref preference, char* label, char* file, int line)
{
#else
void* Hunk_Alloc(int size, ha_pref preference)
{
#endif
    void* buf;

    if (s_hunkData == NULL) {
        Com_Error(ERR_FATAL, "Hunk_Alloc: Hunk memory system not initialized");
    }

    // can't do preference if there is any temp allocated
    if (preference == h_dontcare || hunk_temp->temp != hunk_temp->permanent) {
        Hunk_SwapBanks();
    } else {
        if (preference == h_low && hunk_permanent != &hunk_low) {
            Hunk_SwapBanks();
        } else if (preference == h_high && hunk_permanent != &hunk_high) {
            Hunk_SwapBanks();
        }
    }

#ifdef HUNK_DEBUG
    size += sizeof(hunkblock_t);
#endif

    // round to cacheline
    size = (size + 31) & ~31;

    if (hunk_low.temp + hunk_high.temp + size > s_hunkTotal) {
#ifdef HUNK_DEBUG
        Hunk_Log();
        Hunk_SmallLog();

        Com_Error(ERR_DROP, "Hunk_Alloc failed on %i: %s, line: %d (%s)", size, file, line, label);
#else
        Com_Error(ERR_DROP, "Hunk_Alloc failed on %i", size);
#endif
    }

    if (hunk_permanent == &hunk_low) {
        buf = (void*)(s_hunkData + hunk_permanent->permanent);
        hunk_permanent->permanent += size;
    } else {
        hunk_permanent->permanent += size;
        buf = (void*)(s_hunkData + s_hunkTotal - hunk_permanent->permanent);
    }

    hunk_permanent->temp = hunk_permanent->permanent;

    memset(buf, 0, size);

#ifdef HUNK_DEBUG
    {
        hunkblock_t* block;

        block = (hunkblock_t*)buf;
        block->size = size - sizeof(hunkblock_t);
        block->file = file;
        block->label = label;
        block->line = line;
        block->next = hunkblocks;
        hunkblocks = block;
        buf = ((uint8_t*)buf) + sizeof(hunkblock_t);
    }
#endif
    return buf;
}

/*
=================
Hunk_AllocateTempMemory

This is used by the file loading system.
Multiple files can be loaded in temporary memory.
When the files-in-use count reaches zero, all temp memory will be deleted
=================
*/
void* Hunk_AllocateTempMemory(const size_t size)
{
    void* buf;
    hunkHeader_t* hdr;

    // return a Z_Malloc'd block if the hunk has not been initialized
    // this allows the config and product id files ( journal files too ) to be loaded
    // by the file system without redundant routines in the file system utilizing different
    // memory systems
    if (s_hunkData == NULL) {
        return Z_Malloc(size);
    }

    Hunk_SwapBanks();

    const size_t actual_size = PAD(size, sizeof(intptr_t)) + sizeof(hunkHeader_t);

    if (hunk_temp->temp + hunk_permanent->permanent + actual_size > s_hunkTotal) {
        Com_Error(ERR_DROP, "Hunk_AllocateTempMemory: failed on %zu", actual_size);
    }

    if (hunk_temp == &hunk_low) {
        buf = (void*)(s_hunkData + hunk_temp->temp);
        hunk_temp->temp += actual_size;
    } else {
        hunk_temp->temp += actual_size;
        buf = (void*)(s_hunkData + s_hunkTotal - hunk_temp->temp);
    }

    if (hunk_temp->temp > hunk_temp->tempHighwater) {
        hunk_temp->tempHighwater = hunk_temp->temp;
    }

    hdr = (hunkHeader_t*)buf;
    buf = (void*)(hdr + 1);

    hdr->magic = HUNK_MAGIC;
    hdr->size = actual_size;

    // don't bother clearing, because we are going to load a file over it
    return buf;
}

void Hunk_FreeTempMemory(void* buf)
{
    hunkHeader_t* hdr;

    // free with Z_Free if the hunk has not been initialized
    // this allows the config and product id files ( journal files too ) to be loaded
    // by the file system without redundant routines in the file system utilizing different
    // memory systems
    if (s_hunkData == NULL) {
        Z_Free(buf);
        return;
    }

    hdr = ((hunkHeader_t*)buf) - 1;
    if (hdr->magic != HUNK_MAGIC) {
        Com_Error(ERR_FATAL, "Hunk_FreeTempMemory: bad magic");
    }

    hdr->magic = HUNK_FREE_MAGIC;

    // this only works if the files are freed in stack order,
    // otherwise the memory will stay around until Hunk_ClearTempMemory
    if (hunk_temp == &hunk_low) {
        if (hdr == (void*)(s_hunkData + hunk_temp->temp - hdr->size)) {
            hunk_temp->temp -= hdr->size;
        } else {
            Com_Printf("Hunk_FreeTempMemory: not the final block\n");
        }
    } else {
        if (hdr == (void*)(s_hunkData + s_hunkTotal - hunk_temp->temp)) {
            hunk_temp->temp -= hdr->size;
        } else {
            Com_Printf("Hunk_FreeTempMemory: not the final block\n");
        }
    }
}

/*
=================
Hunk_ClearTempMemory

The temp space is no longer needed.  If we have left more
touched but unused memory on this side, have future
permanent allocs use this side.
=================
*/
void Hunk_ClearTempMemory()
{
    if (s_hunkData != NULL) {
        hunk_temp->temp = hunk_temp->permanent;
    }
}

/*
===================================================================

EVENTS AND JOURNALING

In addition to these events, .cfg files are also copied to the
journaled file
===================================================================
*/

#define MAX_PUSHED_EVENTS 1024
static int com_pushedEventsHead = 0;
static int com_pushedEventsTail = 0;
static sysEvent_t com_pushedEvents[MAX_PUSHED_EVENTS];

void Com_InitJournaling()
{
    Com_StartupVariable("journal");
    com_journal = Cvar_Get("journal", "0", CVAR_INIT);
    if (!com_journal->integer) {
        return;
    }

    if (com_journal->integer == 1) {
        Com_Printf("Journaling events\n");
        com_journalFile = FS_FOpenFileWrite("journal.dat");
        com_journalDataFile = FS_FOpenFileWrite("journaldata.dat");
    } else if (com_journal->integer == 2) {
        Com_Printf("Replaying journaled events\n");
        FS_FOpenFileRead("journal.dat", &com_journalFile, true);
        FS_FOpenFileRead("journaldata.dat", &com_journalDataFile, true);
    }

    if (!com_journalFile || !com_journalDataFile) {
        Cvar_Set("com_journal", "0");
        com_journalFile = 0;
        com_journalDataFile = 0;
        Com_Printf("Couldn't open journal files\n");
    }
}

/*
========================================================================

EVENT LOOP

========================================================================
*/

#define MAX_QUEUED_EVENTS 256
#define MASK_QUEUED_EVENTS (MAX_QUEUED_EVENTS - 1)

static sysEvent_t eventQueue[MAX_QUEUED_EVENTS];
static int eventHead = 0;
static int eventTail = 0;

/*
================
Com_QueueEvent

A time of 0 will get the current time
Ptr should either be null, or point to a block of data that can
be freed by the game later.
================
*/
void Com_QueueEvent(int time, sysEventType_t type, int value, int value2, int ptrLength, void* ptr)
{
    sysEvent_t* ev;

    // combine mouse movement with previous mouse event
    if (type == SE_MOUSE && eventHead != eventTail) {
        ev = &eventQueue[(eventHead + MAX_QUEUED_EVENTS - 1) & MASK_QUEUED_EVENTS];

        if (ev->evType == SE_MOUSE) {
            ev->evValue += value;
            ev->evValue2 += value2;
            return;
        }
    }

    ev = &eventQueue[eventHead & MASK_QUEUED_EVENTS];

    if (eventHead - eventTail >= MAX_QUEUED_EVENTS) {
        Com_Printf("Com_QueueEvent: overflow\n");
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

sysEvent_t Com_GetSystemEvent()
{
    sysEvent_t ev;

    // return if we have data
    if (eventHead > eventTail) {
        eventTail++;
        return eventQueue[(eventTail - 1) & MASK_QUEUED_EVENTS];
    }

    // return if we have data
    if (eventHead > eventTail) {
        eventTail++;
        return eventQueue[(eventTail - 1) & MASK_QUEUED_EVENTS];
    }

    // create an empty event to return
    memset(&ev, 0, sizeof(ev));
    ev.evTime = Sys_Milliseconds();

    return ev;
}

sysEvent_t Com_GetRealEvent()
{
    int r;
    sysEvent_t ev;

    // either get an event from the system or the journal file
    if (com_journal->integer == 2) {
        r = FS_Read(&ev, sizeof(ev), com_journalFile);
        if (r != sizeof(ev)) {
            Com_Error(ERR_FATAL, "Error reading from journal file");
        }
        if (ev.evPtrLength) {
            ev.evPtr = Z_Malloc(ev.evPtrLength);
            r = FS_Read(ev.evPtr, ev.evPtrLength, com_journalFile);
            if (r != ev.evPtrLength) {
                Com_Error(ERR_FATAL, "Error reading from journal file");
            }
        }
    } else {
        ev = Com_GetSystemEvent();

        // write the journal value out if needed
        if (com_journal->integer == 1) {
            r = FS_Write(&ev, sizeof(ev), com_journalFile);
            if (r != sizeof(ev)) {
                Com_Error(ERR_FATAL, "Error writing to journal file");
            }
            if (ev.evPtrLength) {
                r = FS_Write(ev.evPtr, ev.evPtrLength, com_journalFile);
                if (r != ev.evPtrLength) {
                    Com_Error(ERR_FATAL, "Error writing to journal file");
                }
            }
        }
    }

    return ev;
}

void Com_InitPushEvent()
{
    // clear the static buffer array
    // this requires SE_NONE to be accepted as a valid but NOP event
    memset(com_pushedEvents, 0, sizeof(com_pushedEvents));
    // reset counters while we are at it
    // beware: GetEvent might still return an SE_NONE from the buffer
    com_pushedEventsHead = 0;
    com_pushedEventsTail = 0;
}

void Com_PushEvent(sysEvent_t* event)
{
    sysEvent_t* ev;
    static int printedWarning = 0;

    ev = &com_pushedEvents[com_pushedEventsHead & (MAX_PUSHED_EVENTS - 1)];

    if (com_pushedEventsHead - com_pushedEventsTail >= MAX_PUSHED_EVENTS) {

        // don't print the warning constantly, or it can give time for more...
        if (!printedWarning) {
            printedWarning = true;
            Com_Printf("WARNING: Com_PushEvent overflow\n");
        }

        if (ev->evPtr) {
            Z_Free(ev->evPtr);
        }
        com_pushedEventsTail++;
    } else {
        printedWarning = false;
    }

    *ev = *event;
    com_pushedEventsHead++;
}

sysEvent_t Com_GetEvent()
{
    if (com_pushedEventsHead > com_pushedEventsTail) {
        com_pushedEventsTail++;
        return com_pushedEvents[(com_pushedEventsTail - 1) & (MAX_PUSHED_EVENTS - 1)];
    }
    return Com_GetRealEvent();
}

void Com_RunAndTimeServerPacket(netadr_t* evFrom, msg_t* buf)
{
    int t1, t2, msec;

    t1 = 0;

    if (com_speeds->integer) {
        t1 = Sys_Milliseconds();
    }

    SV_PacketEvent(*evFrom, buf);

    if (com_speeds->integer) {
        t2 = Sys_Milliseconds();
        msec = t2 - t1;
        if (com_speeds->integer == 3) {
            Com_Printf("SV_PacketEvent time: %i\n", msec);
        }
    }
}

/*
=================
Com_EventLoop

Returns last event time
=================
*/
int Com_EventLoop()
{
    sysEvent_t ev;
    netadr_t evFrom;
    uint8_t bufData[MAX_MSGLEN];
    msg_t buf;

    MSG_Init(&buf, bufData, sizeof(bufData));

    while (1) {
        ev = Com_GetEvent();

        // if no more events are available
        if (ev.evType == SE_NONE) {
#ifndef DEDICATED
            // manually send packet events for the loopback channel
            while (NET_GetLoopPacket(NS_CLIENT, &evFrom, &buf)) {
                CL_PacketEvent(evFrom, &buf);
            }
#endif
            while (NET_GetLoopPacket(NS_SERVER, &evFrom, &buf)) {
                // if the server just shut down, flush the events
                if (com_sv_running->integer) {
                    Com_RunAndTimeServerPacket(&evFrom, &buf);
                }
            }

            return ev.evTime;
        }

        switch (ev.evType) {
        case SE_KEY:
#ifndef DEDICATED
            CL_KeyEvent(ev.evValue, ev.evValue2, ev.evTime);
#endif
            break;
        case SE_CHAR:
#ifndef DEDICATED
            CL_CharEvent(ev.evValue);
#endif
            break;
        case SE_MOUSE:
#ifndef DEDICATED
            CL_MouseEvent(ev.evValue, ev.evValue2, ev.evTime);
#endif
            break;
        case SE_JOYSTICK_AXIS:
#ifndef DEDICATED
            CL_JoystickEvent(ev.evValue, ev.evValue2, ev.evTime);
#endif
            break;
        default:
            Com_Error(ERR_FATAL, "Com_EventLoop: bad event type %i", ev.evType);
            break;
        }

        // free any block data
        if (ev.evPtr) {
            Z_Free(ev.evPtr);
        }
    }

    return 0; // never reached
}

/*
================
Com_Milliseconds

Can be used for profiling, but will be journaled accurately
================
*/
int Com_Milliseconds()
{
    sysEvent_t ev;

    // get events and push them until we get a null event with the current time
    do {
        ev = Com_GetRealEvent();
        if (ev.evType != SE_NONE) {
            Com_PushEvent(&ev);
        }
    } while (ev.evType != SE_NONE);

    return ev.evTime;
}

//============================================================================

/*
=============
Com_Error_f

Just throw a fatal error to
test error shutdown procedures
=============
*/
static void __attribute__((__noreturn__)) Com_Error_f()
{
    if (Cmd_Argc() > 1) {
        Com_Error(ERR_DROP, "Testing drop error");
    } else {
        Com_Error(ERR_FATAL, "Testing fatal error");
    }
}

/*
=============
Com_Freeze_f

Just freeze in place for a given number of seconds to test
error recovery
=============
*/
static void Com_Freeze_f()
{
    float s;
    int start, now;

    if (Cmd_Argc() != 2) {
        Com_Printf("freeze <seconds>\n");
        return;
    }
    s = atof(Cmd_Argv(1));

    start = Com_Milliseconds();

    while (1) {
        now = Com_Milliseconds();
        if ((now - start) * 0.001 > s) {
            break;
        }
    }
}

/*
=================
Com_Crash_f

A way to force a bus error for development reasons
=================
*/
static void Com_Crash_f()
{
    *(volatile int*)0 = 0x12345678;
}

/*
==================
Com_ExecuteCfg

For controlling environment variables
==================
*/

void Com_ExecuteCfg()
{
    Cbuf_ExecuteText(EXEC_NOW, "exec default.cfg\n");
    Cbuf_Execute(); // Always execute after exec to prevent text buffer overflowing

    if (!Com_SafeMode()) {
        // skip the q3config.cfg and autoexec.cfg if "safe" is on the command line
        Cbuf_ExecuteText(EXEC_NOW, "exec " Q3CONFIG_CFG "\n");
        Cbuf_Execute();
        Cbuf_ExecuteText(EXEC_NOW, "exec autoexec.cfg\n");
        Cbuf_Execute();
    }
}

/*
==================
Com_GameRestart

Change to a new mod properly with cleaning up cvars before switching.
==================
*/

void Com_GameRestart(int checksumFeed, bool disconnect)
{
    // make sure no recursion can be triggered
    if (!com_gameRestarting && com_fullyInitialized) {
        com_gameRestarting = true;
        com_gameClientRestarting = com_cl_running->integer;

        // Kill server if we have one
        if (com_sv_running->integer)
            SV_Shutdown("Game directory changed");

        if (com_gameClientRestarting) {
#ifndef DEDICATED
            if (disconnect)
                CL_Disconnect(false);

            CL_Shutdown("Game directory changed", disconnect, false);
#endif
        }

        FS_Restart(checksumFeed);

        // Clean out any user and VM created cvars
        Cvar_Restart(true);
        Com_ExecuteCfg();

        if (disconnect) {
            // We don't want to change any network settings if gamedir
            // change was triggered by a connect to server because the
            // new network settings might make the connection fail.
            NET_Restart_f();
        }

        if (com_gameClientRestarting) {
#ifndef DEDICATED
            CL_Init();
            CL_StartHunkUsers(false);
#endif
        }

        com_gameRestarting = false;
        com_gameClientRestarting = false;
    }
}

/*
==================
Com_GameRestart_f

Expose possibility to change current running mod to the user
==================
*/

void Com_GameRestart_f()
{
    Cvar_Set("fs_game", Cmd_Argv(1));

    Com_GameRestart(0, true);
}

/*
=================
Com_InitRand
Seed the random number generator, if possible with an OS supplied random seed.
=================
*/
static void Com_InitRand()
{
    unsigned int seed;

    if (Sys_RandomBytes((uint8_t*)&seed, sizeof(seed)))
        srand(seed);
    else
        srand(time(NULL));
}

void Com_Init(char* commandLine)
{
    char* s;
    int qport;

    Com_Printf("%s %s\n", Q3_VERSION, PLATFORM_STRING);

    if (setjmp(abortframe)) {
        Sys_Error("Error during initialization");
    }

    // Clear queues
    memset(&eventQueue[0], 0, MAX_QUEUED_EVENTS * sizeof(sysEvent_t));

    // initialize the weak pseudo-random number generator for use later.
    Com_InitRand();

    // do this before anything else decides to push events
    Com_InitPushEvent();

    Com_InitSmallZoneMemory();
    Cvar_Init();

    // prepare enough of the subsystems to handle
    // cvar and command buffer management
    Com_ParseCommandLine(commandLine);

    Cbuf_Init();

    // override anything from the config files with command line args
    Com_StartupVariable(NULL);

    Com_InitZoneMemory();
    Cmd_Init();

    // get the developer cvar set as early as possible
    com_developer = Cvar_Get("developer", "0", CVAR_TEMP);

#ifndef DEDICATED
    // done early so bind command exists
    CL_InitKeyCommands();
#endif

    com_basegame = Cvar_Get("com_basegame", BASEGAME, CVAR_INIT);
    com_homepath = Cvar_Get("com_homepath", "", CVAR_INIT | CVAR_PROTECTED);

    FS_InitFilesystem();

    Com_InitJournaling();

    // Add some commands here already so users can use them from config files
    if (com_developer && com_developer->integer) {
        Cmd_AddCommand("error", Com_Error_f);
        Cmd_AddCommand("crash", Com_Crash_f);
        Cmd_AddCommand("freeze", Com_Freeze_f);
    }
    Cmd_AddCommand("quit", Com_Quit_f);
    Cmd_AddCommand("changeVectors", MSG_ReportChangeVectors_f);
    Cmd_AddCommand("writeconfig", Com_WriteConfig_f);
    Cmd_SetCommandCompletionFunc("writeconfig", Cmd_CompleteCfgName);
    Cmd_AddCommand("game_restart", Com_GameRestart_f);

    Com_ExecuteCfg();

    // override anything from the config files with command line args
    Com_StartupVariable(NULL);

    // allocate the stack based hunk allocator
    Com_InitHunkMemory();

    // if any archived cvars are modified after this, we will trigger a writing
    // of the config file
    cvar_modifiedFlags &= ~CVAR_ARCHIVE;

    // init commands and vars
    com_logfile = Cvar_Get("logfile", "0", CVAR_TEMP);

    com_timescale = Cvar_Get("timescale", "1", CVAR_CHEAT | CVAR_SYSTEMINFO);
    com_fixedtime = Cvar_Get("fixedtime", "0", CVAR_CHEAT);
    com_showtrace = Cvar_Get("com_showtrace", "0", CVAR_CHEAT);
    com_speeds = Cvar_Get("com_speeds", "0", 0);
    com_timedemo = Cvar_Get("timedemo", "0", CVAR_CHEAT);
    com_cameraMode = Cvar_Get("com_cameraMode", "0", CVAR_CHEAT);

    cl_paused = Cvar_Get("cl_paused", "0", CVAR_ROM);
    sv_paused = Cvar_Get("sv_paused", "0", CVAR_ROM);
    cl_packetdelay = Cvar_Get("cl_packetdelay", "0", CVAR_CHEAT);
    sv_packetdelay = Cvar_Get("sv_packetdelay", "0", CVAR_CHEAT);
    com_sv_running = Cvar_Get("sv_running", "0", CVAR_ROM);
    com_cl_running = Cvar_Get("cl_running", "0", CVAR_ROM);
    com_buildScript = Cvar_Get("com_buildScript", "0", 0);
    com_ansiColor = Cvar_Get("com_ansiColor", "0", CVAR_ARCHIVE);

    com_busyWait = Cvar_Get("com_busyWait", "0", CVAR_ARCHIVE);
    Cvar_Get("com_errorMessage", "", CVAR_ROM | CVAR_NORESTART);

#ifdef CINEMATICS_INTRO
    com_introPlayed = Cvar_Get("com_introplayed", "0", CVAR_ARCHIVE);
#endif

    s = va("%s %s", Q3_VERSION, PLATFORM_STRING);
    com_version = Cvar_Get("version", s, CVAR_ROM | CVAR_SERVERINFO);
    com_gamename = Cvar_Get("com_gamename", GAMENAME_FOR_MASTER, CVAR_SERVERINFO | CVAR_INIT);
    Cvar_Get("protocol", va("%i", PROTOCOL_VERSION), CVAR_ROM);

#ifndef DEDICATED
    com_maxfps = Cvar_Get("com_maxfps", "85", CVAR_ARCHIVE);
    com_maxfpsUnfocused = Cvar_Get("com_maxfpsUnfocused", "0", CVAR_ARCHIVE);
    com_maxfpsMinimized = Cvar_Get("com_maxfpsMinimized", "0", CVAR_ARCHIVE);
    com_unfocused = Cvar_Get("com_unfocused", "0", CVAR_ROM);
    com_minimized = Cvar_Get("com_minimized", "0", CVAR_ROM);
    con_autochat = Cvar_Get("con_autochat", "1", CVAR_ARCHIVE);
#endif

    Sys_Init();

    // Pick a random port value
    Com_RandomBytes((uint8_t*)&qport, sizeof(int));
    Netchan_Init(qport & 0xffff);

    VM_Init();
    SV_Init();

#ifndef DEDICATED
    CL_Init();
#endif

    // set com_frameTime so that if a map is started on the
    // command line it will still be able to count on com_frameTime
    // being random enough for a serverid
    com_frameTime = Com_Milliseconds();

#ifndef DEDICATED
    // add + commands from command line
    if (!Com_AddStartupCommands()) {
        // if the user didn't give any commands, run default action
#ifdef CINEMATICS_LOGO
        Cbuf_AddText("cinematic " CINEMATICS_LOGO "\n");
#endif
#ifdef CINEMATICS_INTRO
        if (!com_introPlayed->integer) {
            Cvar_Set(com_introPlayed->name, "1");
            Cvar_Set("nextmap", "cinematic " CINEMATICS_INTRO);
        }
#endif
    }
#endif

    // start in full screen ui mode
    Cvar_Set("r_uiFullScreen", "1");

#ifndef DEDICATED
    CL_StartHunkUsers(false);
#endif

    // make sure single player is off by default
    Cvar_Set("ui_singlePlayerActive", "0");

    com_fullyInitialized = true;

    Com_Printf("--- Common Initialization Complete ---\n");
}

//==================================================================

void Com_WriteConfigToFile(const char* filename)
{
    fileHandle_t f;

    f = FS_FOpenFileWrite(filename);
    if (!f) {
        Com_Printf("Couldn't write %s.\n", filename);
        return;
    }

    FS_Printf(f, "// generated by quake, do not modify\n");
#ifndef DEDICATED
    Key_WriteBindings(f);
#endif
    Cvar_WriteVariables(f);
    FS_FCloseFile(f);
}

/*
===============
Com_WriteConfiguration

Writes key bindings and archived cvars to config file if modified
===============
*/
void Com_WriteConfiguration()
{
    // if we are quitting without fully initializing, make sure
    // we don't write out anything
    if (!com_fullyInitialized) {
        return;
    }

    if (!(cvar_modifiedFlags & CVAR_ARCHIVE)) {
        return;
    }
    cvar_modifiedFlags &= ~CVAR_ARCHIVE;

    Com_WriteConfigToFile(Q3CONFIG_CFG);
}

/*
===============
Com_WriteConfig_f

Write the config file to a specific name
===============
*/
void Com_WriteConfig_f()
{
    char filename[MAX_QPATH];

    if (Cmd_Argc() != 2) {
        Com_Printf("Usage: writeconfig <filename>\n");
        return;
    }

    Q_strncpyz(filename, Cmd_Argv(1), sizeof(filename));
    COM_DefaultExtension(filename, sizeof(filename), ".cfg");

    if (!COM_CompareExtension(filename, ".cfg")) {
        Com_Printf("Com_WriteConfig_f: Only the \".cfg\" extension is supported by this command!\n");
        return;
    }

    Com_Printf("Writing %s.\n", filename);
    Com_WriteConfigToFile(filename);
}

int Com_ModifyMsec(int msec)
{
    int clampTime;

    // modify time for debugging values
    if (com_fixedtime->integer) {
        msec = com_fixedtime->integer;
    } else if (com_timescale->value) {
        msec *= com_timescale->value;
    } else if (com_cameraMode->integer) {
        msec *= com_timescale->value;
    }

    // don't let it scale below 1 msec
    if (msec < 1 && com_timescale->value) {
        msec = 1;
    }

#ifdef DEDICATED
    // dedicated servers don't want to clamp for a much longer
    // period, because it would mess up all the client's views
    // of time.
    if (com_sv_running->integer && msec > 500)
        Com_Printf("Hitch warning: %i msec frame time\n", msec);

    clampTime = 5000;
#else
    if (!com_sv_running->integer) {
        // clients of remote servers do not want to clamp time, because
        // it would skew their view of the server's time temporarily
        clampTime = 5000;
    } else {
        // for local single player gaming
        // we may want to clamp the time to prevent players from
        // flying off edges when something hitches.
        clampTime = 200;
    }
#endif

    if (msec > clampTime) {
        msec = clampTime;
    }

    return msec;
}

int Com_TimeVal(int minMsec)
{
    int timeVal;

    timeVal = Sys_Milliseconds() - com_frameTime;

    if (timeVal >= minMsec)
        timeVal = 0;
    else
        timeVal = minMsec - timeVal;

    return timeVal;
}

void Com_Frame()
{

    int msec, minMsec;
    int timeVal, timeValSV;
    static int lastTime = 0;
#ifndef DEDICATED
    static int bias = 0;
#endif

    int timeBeforeFirstEvents;
    int timeBeforeServer;
    int timeBeforeEvents;
    int timeBeforeClient;
    int timeAfter;

    if (setjmp(abortframe)) {
        return; // an ERR_DROP was thrown
    }

    timeBeforeFirstEvents = 0;
    timeBeforeServer = 0;
    timeBeforeEvents = 0;
    timeBeforeClient = 0;
    timeAfter = 0;

    // write config file if anything changed
    Com_WriteConfiguration();

    // main event loop
    if (com_speeds->integer) {
        timeBeforeFirstEvents = Sys_Milliseconds();
    }

    // Figure out how much time we have
    if (!com_timedemo->integer) {
#ifdef DEDICATED
        minMsec = SV_FrameMsec();
#else
        if (com_minimized->integer && com_maxfpsMinimized->integer > 0)
            minMsec = 1000 / com_maxfpsMinimized->integer;
        else if (com_unfocused->integer && com_maxfpsUnfocused->integer > 0)
            minMsec = 1000 / com_maxfpsUnfocused->integer;
        else if (com_maxfps->integer > 0)
            minMsec = 1000 / com_maxfps->integer;
        else
            minMsec = 1;

        timeVal = com_frameTime - lastTime;
        bias += timeVal - minMsec;

        if (bias > minMsec)
            bias = minMsec;

        // Adjust minMsec if previous frame took too long to render so
        // that framerate is stable at the requested value.
        minMsec -= bias;
#endif
    } else
        minMsec = 1;

    do {
        if (com_sv_running->integer) {
            timeValSV = SV_SendQueuedPackets();

            timeVal = Com_TimeVal(minMsec);

            if (timeValSV < timeVal)
                timeVal = timeValSV;
        } else
            timeVal = Com_TimeVal(minMsec);

        if (com_busyWait->integer || timeVal < 1)
            NET_Sleep(0);
        else
            NET_Sleep(timeVal - 1);
    } while (Com_TimeVal(minMsec));

#ifndef DEDICATED
    IN_Frame();
#endif

    lastTime = com_frameTime;
    com_frameTime = Com_EventLoop();

    msec = com_frameTime - lastTime;

    Cbuf_Execute();

    // mess with msec if needed
    msec = Com_ModifyMsec(msec);

    // server side
    if (com_speeds->integer) {
        timeBeforeServer = Sys_Milliseconds();
    }

    SV_Frame(msec);

#ifndef DEDICATED
    // client system
    //
    // run event loop a second time to get server to client packets
    // without a frame of latency
    if (com_speeds->integer) {
        timeBeforeEvents = Sys_Milliseconds();
    }
    Com_EventLoop();
    Cbuf_Execute();

    // client side
    if (com_speeds->integer) {
        timeBeforeClient = Sys_Milliseconds();
    }

    CL_Frame(msec);

    if (com_speeds->integer) {
        timeAfter = Sys_Milliseconds();
    }
#else
    if (com_speeds->integer) {
        timeAfter = Sys_Milliseconds();
        timeBeforeEvents = timeAfter;
        timeBeforeClient = timeAfter;
    }
#endif

    NET_FlushPacketQueue();

    // report timing information
    if (com_speeds->integer) {
        int all, sv, ev, cl;

        all = timeAfter - timeBeforeServer;
        sv = timeBeforeEvents - timeBeforeServer;
        ev = timeBeforeServer - timeBeforeFirstEvents + timeBeforeClient - timeBeforeEvents;
        cl = timeAfter - timeBeforeClient;
        sv -= time_game;
        cl -= time_frontend + time_backend;

        Com_Printf("frame:%i all:%3i sv:%3i ev:%3i cl:%3i gm:%3i rf:%3i bk:%3i\n",
                   com_frameNumber, all, sv, ev, cl, time_game, time_frontend, time_backend);
    }

    // trace optimization tracking
    if (com_showtrace->integer) {

        extern int c_traces, c_brush_traces, c_patch_traces;
        extern int c_pointcontents;

        Com_Printf("%4i traces  (%ib %ip) %4i points\n", c_traces,
                   c_brush_traces, c_patch_traces, c_pointcontents);
        c_traces = 0;
        c_brush_traces = 0;
        c_patch_traces = 0;
        c_pointcontents = 0;
    }

    com_frameNumber++;
}

void Com_Shutdown()
{
    if (logfile) {
        FS_FCloseFile(logfile);
        logfile = 0;
    }

    if (com_journalFile) {
        FS_FCloseFile(com_journalFile);
        com_journalFile = 0;
    }
}

/*
===========================================
command line completion
===========================================
*/

void Field_Clear(field_t* edit)
{
    memset(edit->buffer, 0, MAX_EDIT_LINE);
    edit->cursor = 0;
    edit->scroll = 0;
}

static const char* completionString;
static char shortestMatch[MAX_TOKEN_CHARS];
static int matchCount;
// field we are working on, passed to Field_AutoComplete(&g_consoleCommand for instance)
static field_t* completionField;

static void FindMatches(const char* s)
{
    int i;

    if (Q_stricmpn(s, completionString, strlen(completionString))) {
        return;
    }
    matchCount++;
    if (matchCount == 1) {
        Q_strncpyz(shortestMatch, s, sizeof(shortestMatch));
        return;
    }

    // cut shortestMatch to the amount common with s
    for (i = 0; shortestMatch[i]; i++) {
        if (i >= strlen(s)) {
            shortestMatch[i] = 0;
            break;
        }

        if (tolower(shortestMatch[i]) != tolower(s[i])) {
            shortestMatch[i] = 0;
        }
    }
}

static void PrintMatches(const char* s)
{
    if (!Q_stricmpn(s, shortestMatch, strlen(shortestMatch))) {
        Com_Printf("    %s\n", s);
    }
}

static void PrintCvarMatches(const char* s)
{
    char value[TRUNCATE_LENGTH];

    if (!Q_stricmpn(s, shortestMatch, strlen(shortestMatch))) {
        Com_TruncateLongString(value, Cvar_VariableString(s));
        Com_Printf("    %s = \"%s\"\n", s, value);
    }
}

static char* Field_FindFirstSeparator(char* s)
{
    int i;

    for (i = 0; i < strlen(s); i++) {
        if (s[i] == ';')
            return &s[i];
    }

    return NULL;
}

static bool Field_Complete()
{
    int completionOffset;

    if (matchCount == 0)
        return true;

    completionOffset = strlen(completionField->buffer) - strlen(completionString);

    Q_strncpyz(&completionField->buffer[completionOffset], shortestMatch,
               sizeof(completionField->buffer) - completionOffset);

    completionField->cursor = strlen(completionField->buffer);

    if (matchCount == 1) {
        Q_strcat(completionField->buffer, sizeof(completionField->buffer), " ");
        completionField->cursor++;
        return true;
    }

    Com_Printf("]%s\n", completionField->buffer);

    return false;
}

#ifndef DEDICATED
void Field_CompleteKeyname()
{
    matchCount = 0;
    shortestMatch[0] = 0;

    Key_KeynameCompletion(FindMatches);

    if (!Field_Complete())
        Key_KeynameCompletion(PrintMatches);
}
#endif

void Field_CompleteFilename(const char* dir,
                            const char* ext, bool stripExt, bool allowNonPureFilesOnDisk)
{
    matchCount = 0;
    shortestMatch[0] = 0;

    FS_FilenameCompletion(dir, ext, stripExt, FindMatches, allowNonPureFilesOnDisk);

    if (!Field_Complete())
        FS_FilenameCompletion(dir, ext, stripExt, PrintMatches, allowNonPureFilesOnDisk);
}

void Field_CompleteCommand(char* cmd,
                           bool doCommands, bool doCvars)
{
    int completionArgument = 0;

    // Skip leading whitespace and quotes
    cmd = Com_SkipCharset(cmd, " \"");

    Cmd_TokenizeStringIgnoreQuotes(cmd);
    completionArgument = Cmd_Argc();

    // If there is trailing whitespace on the cmd
    if (*(cmd + strlen(cmd) - 1) == ' ') {
        completionString = "";
        completionArgument++;
    } else
        completionString = Cmd_Argv(completionArgument - 1);

#ifndef DEDICATED
    // add a '\' to the start of the buffer if it might be sent as chat otherwise
    if (con_autochat->integer && completionField->buffer[0] && completionField->buffer[0] != '\\') {
        if (completionField->buffer[0] != '/') {
            // Buffer is full, refuse to complete
            if (strlen(completionField->buffer) + 1 >= sizeof(completionField->buffer))
                return;

            memmove(&completionField->buffer[1],
                    &completionField->buffer[0],
                    strlen(completionField->buffer) + 1);
            completionField->cursor++;
        }

        completionField->buffer[0] = '\\';
    }
#endif

    if (completionArgument > 1) {
        const char* baseCmd = Cmd_Argv(0);
        char* p;

#ifndef DEDICATED
        // This should always be true
        if (baseCmd[0] == '\\' || baseCmd[0] == '/')
            baseCmd++;
#endif

        if ((p = Field_FindFirstSeparator(cmd)))
            Field_CompleteCommand(p + 1, true, true); // Compound command
        else
            Cmd_CompleteArgument(baseCmd, cmd, completionArgument);
    } else {
        if (completionString[0] == '\\' || completionString[0] == '/')
            completionString++;

        matchCount = 0;
        shortestMatch[0] = 0;

        if (strlen(completionString) == 0)
            return;

        if (doCommands)
            Cmd_CommandCompletion(FindMatches);

        if (doCvars)
            Cvar_CommandCompletion(FindMatches);

        if (!Field_Complete()) {
            // run through again, printing matches
            if (doCommands)
                Cmd_CommandCompletion(PrintMatches);

            if (doCvars)
                Cvar_CommandCompletion(PrintCvarMatches);
        }
    }
}

/*
===============
Field_AutoComplete

Perform Tab expansion
===============
*/
void Field_AutoComplete(field_t* field)
{
    completionField = field;

    Field_CompleteCommand(completionField->buffer, true, true);
}

/*
==================
Com_RandomBytes

fills string array with len random bytes, preferably from the OS randomizer
==================
*/
void Com_RandomBytes(uint8_t* string, int len)
{
    int i;

    if (Sys_RandomBytes(string, len))
        return;

    Com_Printf("Com_RandomBytes: using weak randomization\n");
    for (i = 0; i < len; i++)
        string[i] = (unsigned char)(rand() % 256);
}

/*
==================
Com_IsVoipTarget

Returns non-zero if given clientNum is enabled in voipTargets, zero otherwise.
If clientNum is negative return if any bit is set.
==================
*/
bool Com_IsVoipTarget(uint8_t* voipTargets, int voipTargetsSize, int clientNum)
{
    int index;
    if (clientNum < 0) {
        for (index = 0; index < voipTargetsSize; index++) {
            if (voipTargets[index])
                return true;
        }

        return false;
    }

    index = clientNum >> 3;

    if (index < voipTargetsSize)
        return (voipTargets[index] & (1 << (clientNum & 0x07)));

    return false;
}

static bool Field_CompletePlayerNameFinal(bool whitespace)
{
    int completionOffset;

    if (matchCount == 0)
        return true;

    completionOffset = strlen(completionField->buffer) - strlen(completionString);

    Q_strncpyz(&completionField->buffer[completionOffset], shortestMatch,
               sizeof(completionField->buffer) - completionOffset);

    completionField->cursor = strlen(completionField->buffer);

    if (matchCount == 1 && whitespace) {
        Q_strcat(completionField->buffer, sizeof(completionField->buffer), " ");
        completionField->cursor++;
        return true;
    }

    return false;
}

static void Name_PlayerNameCompletion(const char** names, int nameCount, void (*callback)(const char* s))
{
    int i;

    for (i = 0; i < nameCount; i++) {
        callback(names[i]);
    }
}

bool Com_FieldStringToPlayerName(char* name, int length, const char* rawname)
{
    char hex[5];
    int i;
    int ch;

    if (name == NULL || rawname == NULL)
        return false;

    if (length <= 0)
        return true;

    for (i = 0; *rawname && i + 1 <= length; rawname++, i++) {
        if (*rawname == '\\') {
            Q_strncpyz(hex, rawname + 1, sizeof(hex));
            ch = Com_HexStrToInt(hex);
            if (ch > -1) {
                name[i] = ch;
                rawname += 4; // hex string length, 0xXX
            } else {
                name[i] = *rawname;
            }
        } else {
            name[i] = *rawname;
        }
    }
    name[i] = '\0';

    return true;
}

bool Com_PlayerNameToFieldString(char* str, int length, const char* name)
{
    const char* p;
    int i;
    int x1, x2;

    if (str == NULL || name == NULL)
        return false;

    if (length <= 0)
        return true;

    *str = '\0';
    p = name;

    for (i = 0; *p != '\0'; i++, p++) {
        if (i + 1 >= length)
            break;

        if (*p <= ' ') {
            if (i + 5 + 1 >= length)
                break;

            x1 = *p >> 4;
            x2 = *p & 15;

            str[i + 0] = '\\';
            str[i + 1] = '0';
            str[i + 2] = 'x';
            str[i + 3] = x1 > 9 ? x1 - 10 + 'a' : x1 + '0';
            str[i + 4] = x2 > 9 ? x2 - 10 + 'a' : x2 + '0';

            i += 4;
        } else {
            str[i] = *p;
        }
    }
    str[i] = '\0';

    return true;
}

void Field_CompletePlayerName(const char** names, int nameCount)
{
    bool whitespace;

    matchCount = 0;
    shortestMatch[0] = 0;

    if (nameCount <= 0)
        return;

    Name_PlayerNameCompletion(names, nameCount, FindMatches);

    if (completionString[0] == '\0') {
        Com_PlayerNameToFieldString(shortestMatch, sizeof(shortestMatch), names[0]);
    }

    // allow to tab player names
    // if full player name switch to next player name
    if (completionString[0] != '\0'
        && Q_stricmp(shortestMatch, completionString) == 0
        && nameCount > 1) {
        int i;

        for (i = 0; i < nameCount; i++) {
            if (Q_stricmp(names[i], completionString) == 0) {
                i++;
                if (i >= nameCount) {
                    i = 0;
                }

                Com_PlayerNameToFieldString(shortestMatch, sizeof(shortestMatch), names[i]);
                break;
            }
        }
    }

    if (matchCount > 1) {
        Com_Printf("]%s\n", completionField->buffer);

        Name_PlayerNameCompletion(names, nameCount, PrintMatches);
    }

    whitespace = nameCount == 1 ? true : false;
    if (!Field_CompletePlayerNameFinal(whitespace)) {
    }
}

int QDECL Com_strCompare(const void* a, const void* b)
{
    const char** pa = (const char**)a;
    const char** pb = (const char**)b;
    return strcmp(*pa, *pb);
}
