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
// qcommon.h -- definitions common between client and server, but not game.or ref modules
#ifndef QCOMMON_H
#define QCOMMON_H

#include "attributes.h"
#include "q_shared.h"
#include "cm_public.h"

//
// msg.c
//
typedef struct {
    bool allowoverflow; // if false, do a Com_Error
    bool overflowed; // set to true if the buffer size failed (with allowoverflow set)
    bool oob; // set to true if the buffer size failed (with allowoverflow set)
    uint8_t* data;
    int maxsize;
    int cursize;
    int readcount;
    int bit; // for bitwise reads and writes
} msg_t;

void MSG_Init(msg_t* buf, uint8_t* data, int length);
void MSG_InitOOB(msg_t* buf, uint8_t* data, int length);
void MSG_Clear(msg_t* buf);
void MSG_WriteData(msg_t* buf, const void* data, int length);
void MSG_Bitstream(msg_t* buf);

// TTimo
// copy a msg_t in case we need to store it as is for a bit
// (as I needed this to keep an msg_t from a static var for later use)
// sets data buffer as MSG_Init does prior to do the copy
void MSG_Copy(msg_t* buf, uint8_t* data, int length, msg_t* src);

struct entityState_s;
struct playerState_s;

void MSG_WriteBits(msg_t* msg, int value, int bits);

void MSG_WriteChar(msg_t* sb, int c);
void MSG_WriteByte(msg_t* sb, int c);
void MSG_WriteShort(msg_t* sb, int c);
void MSG_WriteLong(msg_t* sb, int c);
void MSG_WriteString(msg_t* sb, const char* s);
void MSG_WriteBigString(msg_t* sb, const char* s);

void MSG_BeginReadingOOB(msg_t* sb);

int MSG_ReadBits(msg_t* msg, int bits);

int MSG_ReadByte(msg_t* sb);
int MSG_ReadShort(msg_t* sb);
int MSG_ReadLong(msg_t* sb);
char* MSG_ReadString(msg_t* sb);
char* MSG_ReadBigString(msg_t* sb);
char* MSG_ReadStringLine(msg_t* sb);
void MSG_ReadData(msg_t* sb, void* buffer, int size);

void MSG_WriteDeltaUsercmdKey(msg_t* msg, int key, usercmd_t* from, usercmd_t* to);
void MSG_ReadDeltaUsercmdKey(msg_t* msg, int key, usercmd_t* from, usercmd_t* to);

void MSG_WriteDeltaEntity(msg_t* msg, struct entityState_s* from, struct entityState_s* to, bool force);
void MSG_ReadDeltaEntity(msg_t* msg, entityState_t* from, entityState_t* to,
                         int number);

void MSG_WriteDeltaPlayerstate(msg_t* msg, struct playerState_s* from, struct playerState_s* to);
void MSG_ReadDeltaPlayerstate(msg_t* msg, struct playerState_s* from, struct playerState_s* to);

#define PACKET_BACKUP 32 // number of old messages that must be kept on client and
                         // server for delta comrpession and ping estimation
#define PACKET_MASK (PACKET_BACKUP - 1)

#define MAX_PACKET_USERCMDS 32 // max number of usercmd_t in a packet

#define PORT_ANY -1

#define MAX_RELIABLE_COMMANDS 64 // max string commands buffered for restransmit

typedef enum {
    NA_BOT,
    NA_BAD, // an address lookup failed
    NA_LOOPBACK,
    NA_BROADCAST,
    NA_IP,
    NA_IPX,
    NA_BROADCAST_IPX
} netadrtype_t;

typedef enum {
#ifndef DEDICATED
    NS_CLIENT,
#endif
    NS_SERVER
} netsrc_t;

typedef struct {
    netadrtype_t type;

    uint8_t ip[4];
    uint8_t ipx[10];

    unsigned short port;
} netadr_t;

void NET_Init(void);
void NET_Shutdown(void);
void NET_Restart(void);
void NET_Config(bool enableNetworking);

void NET_SendPacket(netsrc_t sock, int length, const void* data, netadr_t to);
void QDECL NET_OutOfBandPrint(netsrc_t net_socket, netadr_t adr, const char* format, ...) PRINTF_LIKE_FUNCTION(3, 4);
void QDECL NET_OutOfBandData(netsrc_t sock, netadr_t adr, uint8_t* format, int len);

bool NET_CompareAdr(netadr_t a, netadr_t b);
bool NET_CompareBaseAdr(netadr_t a, netadr_t b);
bool NET_IsLocalAddress(netadr_t adr);
const char* NET_AdrToString(netadr_t a);
bool NET_StringToAdr(const char* s, netadr_t* a);
bool NET_GetLoopPacket(netsrc_t sock, netadr_t* net_from, msg_t* net_message);
void NET_Sleep(int msec);

#define MAX_MSGLEN 16384 // max length of a message, which may
                         // be fragmented into multiple packets

#define MAX_DOWNLOAD_WINDOW 8 // max of eight download frames
#define MAX_DOWNLOAD_BLKSIZE 2048 // 2048 byte block chunks

/*
Netchan handles packet fragmentation and out of order / duplicate suppression
*/

typedef struct {
    netsrc_t sock;

    int dropped; // between last packet and previous

    netadr_t remoteAddress;
    int qport; // qport value to write when transmitting

    // sequencing variables
    int incomingSequence;
    int outgoingSequence;

    // incoming fragment assembly buffer
    int fragmentSequence;
    int fragmentLength;
    uint8_t fragmentBuffer[MAX_MSGLEN];

    // outgoing fragment buffer
    // we need to space out the sending of large fragmented messages
    bool unsentFragments;
    int unsentFragmentStart;
    int unsentLength;
    uint8_t unsentBuffer[MAX_MSGLEN];
} netchan_t;

void Netchan_Init(int qport);
void Netchan_Setup(netsrc_t sock, netchan_t* chan, netadr_t adr, int qport);

void Netchan_Transmit(netchan_t* chan, int length, const uint8_t* data);
void Netchan_TransmitNextFragment(netchan_t* chan);

bool Netchan_Process(netchan_t* chan, msg_t* msg);

#define PROTOCOL_VERSION 68
// 1.31 - 67

// maintain a list of compatible protocols for demo playing
// NOTE: that stuff only works with two digits protocols
extern int demo_protocols[];

#define UPDATE_SERVER_NAME "update.quake3arena.com"
// override on command line, config files etc.
#ifndef MASTER_SERVER_NAME
#define MASTER_SERVER_NAME "master.quake3arena.com"
#endif
#ifndef AUTHORIZE_SERVER_NAME
#define AUTHORIZE_SERVER_NAME "authorize.quake3arena.com"
#endif

#define PORT_MASTER 27950
#define PORT_UPDATE 27951
#ifndef PORT_AUTHORIZE
#define PORT_AUTHORIZE 27952
#endif
#define PORT_SERVER 27960
#define NUM_SERVER_PORTS 4 // broadcast scan this many ports after
                           // PORT_SERVER so a single machine can
                           // run multiple servers

// the svc_strings[] array in cl_parse.c should mirror this
//
// server to client
//
enum svc_ops_e {
    svc_bad,
    svc_nop,
    svc_gamestate,
    svc_configstring, // [short] [string] only in gamestate messages
    svc_baseline, // only in gamestate messages
    svc_serverCommand, // [string] to be executed by client game module
    svc_download, // [short] size [size bytes]
    svc_snapshot,
    svc_EOF
};

//
// client to server
//
enum clc_ops_e {
    clc_bad,
    clc_nop,
    clc_move, // [[usercmd_t]
    clc_moveNoDelta, // [[usercmd_t]
    clc_clientCommand, // [string] message
    clc_EOF
};

/*
==============================================================

VIRTUAL MACHINE

==============================================================
*/

typedef struct vm_s vm_t;

typedef enum {
    VMI_NATIVE,
    VMI_BYTECODE
} vmInterpret_t;

typedef enum {
    TRAP_MEMSET = 100,
    TRAP_MEMCPY,
    TRAP_STRNCPY,
    TRAP_SIN,
    TRAP_COS,
    TRAP_ATAN2,
    TRAP_SQRT,
    TRAP_MATRIXMULTIPLY,
    TRAP_ANGLEVECTORS,
    TRAP_PERPENDICULARVECTOR,
    TRAP_FLOOR,
    TRAP_CEIL,

    TRAP_TESTPRINTFLOAT
} sharedTraps_t;

typedef int(QDECL* vmMainProc)(int, ...);
typedef int(QDECL* vmDllSystemCall)(int, ...);

void VM_Init(void);
vm_t* VM_Create(const char* module, int (*systemCalls)(int*),
                vmInterpret_t interpret);
// module should be bare: "cgame", not "cgame.dll" or "vm/cgame.qvm"

void VM_Free(vm_t* vm);
void VM_Clear(void);
vm_t* VM_Restart(vm_t* vm);

int QDECL VM_Call(vm_t* vm, int callNum, ...);

void VM_Debug(int level);

void* VM_ArgPtr(int intValue);
void* VM_ExplicitArgPtr(vm_t* vm, int intValue);

/*
==============================================================

CMD

Command text buffering and command execution

==============================================================
*/

/*

Any number of commands can be added in a frame, from several different sources.
Most commands come from either keybindings or console line input, but entire text
files can be execed.

*/

void Cbuf_Init(void);
// allocates an initial text buffer that will grow as needed

void Cbuf_AddText(const char* text);
// Adds command text at the end of the buffer, does NOT add a final \n

void Cbuf_ExecuteText(int exec_when, const char* text);
// this can be used in place of either Cbuf_AddText or Cbuf_InsertText

void Cbuf_Execute(void);
// Pulls off \n terminated lines of text from the command buffer and sends
// them through Cmd_ExecuteString.  Stops when the buffer is empty.
// Normally called once per frame, but may be explicitly invoked.
// Do not call inside a command function, or current args will be destroyed.

/*

Command execution takes a null terminated string, breaks it into tokens,
then searches for a command or variable that matches the first token.

*/

typedef void (*xcommand_t)(void);

void Cmd_Init(void);

void Cmd_AddCommand(const char* cmd_name, xcommand_t function);
// called by the init functions of other parts of the program to
// register commands and functions to call for them.
// The cmd_name is referenced later, so it should not be in temp memory
// if function is NULL, the command will be forwarded to the server
// as a clc_clientCommand instead of executed locally

void Cmd_RemoveCommand(const char* cmd_name);

void Cmd_CommandCompletion(void (*callback)(const char* s));
// callback with each valid string

int Cmd_Argc(void);
char* Cmd_Argv(int arg);
void Cmd_ArgvBuffer(int arg, char* buffer, int bufferLength);
char* Cmd_Args(void);
char* Cmd_ArgsFrom(int arg);
void Cmd_ArgsBuffer(char* buffer, int bufferLength);
char* Cmd_Cmd(void);
// The functions that execute commands get their parameters with these
// functions. Cmd_Argv () will return an empty string, not a NULL
// if arg > argc, so string operations are always safe.

void Cmd_TokenizeString(const char* text);
// Takes a null terminated string.  Does not need to be /n terminated.
// breaks the string up into arg tokens.

void Cmd_ExecuteString(const char* text);
// Parses a single line of text into arguments and tries to execute it
// as if it was typed at the console

/*
==============================================================

FILESYSTEM

No stdio calls should be used by any part of the game, because
we need to deal with all sorts of directory and separator char
issues.
==============================================================
*/

// referenced flags
// these are in loop specific order so don't change the order
#define FS_GENERAL_REF 0x01
#define FS_UI_REF 0x02
#define FS_CGAME_REF 0x04
#define FS_QAGAME_REF 0x08
// number of id paks that will never be autodownloaded from baseq3
#define NUM_ID_PAKS 9

#define MAX_FILE_HANDLES 64

#define BASEGAME "baseq3"

bool FS_Initialized(void);

void FS_InitFilesystem(void);
void FS_Shutdown(bool closemfp);

bool FS_ConditionalRestart(int checksumFeed);
void FS_Restart(int checksumFeed);
// shutdown and restart the filesystem so changes to fs_gamedir can take effect

char** FS_ListFiles(const char* directory, const char* extension, int* numfiles);
// directory should not have either a leading or trailing /
// if extension is "/", only subdirectories will be returned
// the returned files will not include any directories or /

void FS_FreeFileList(char** list);

bool FS_FileExists(const char* file);

int FS_LoadStack(void);

int FS_GetFileList(const char* path, const char* extension, char* listbuf, int bufsize);
int FS_GetModList(char* listbuf, int bufsize);

fileHandle_t FS_FOpenFileWrite(const char* qpath);
// will properly create any needed paths and deal with separater character issues

int FS_filelength(fileHandle_t f);
fileHandle_t FS_SV_FOpenFileWrite(const char* filename);
int FS_SV_FOpenFileRead(const char* filename, fileHandle_t* fp);
void FS_SV_Rename(const char* from, const char* to);
int FS_FOpenFileRead(const char* qpath, fileHandle_t* file, bool uniqueFILE);
// if uniqueFILE is true, then a new FILE will be fopened even if the file
// is found in an already open pak file.  If uniqueFILE is false, you must call
// FS_FCloseFile instead of fclose, otherwise the pak FILE would be improperly closed
// It is generally safe to always set uniqueFILE to true, because the majority of
// file IO goes through FS_ReadFile, which Does The Right Thing already.

int FS_FileIsInPAK(const char* filename, int* pChecksum);
// returns 1 if a file is in the PAK file, otherwise -1

int FS_Write(const void* buffer, int len, fileHandle_t f);

int FS_Read(void* buffer, int len, fileHandle_t f);
// properly handles partial reads and reads from other dlls

void FS_FCloseFile(fileHandle_t f);
// note: you can't just fclose from another DLL, due to MS libc issues

int FS_ReadFile(const char* qpath, void** buffer);
// returns the length of the file
// a null buffer will just return the file length without loading
// as a quick check for existence. -1 length == not present
// A 0 byte will always be appended at the end, so string ops are safe.
// the buffer should be considered read-only, because it may be cached
// for other uses.

void FS_ForceFlush(fileHandle_t f);
// forces flush on files we're writing to.

void FS_FreeFile(void* buffer);
// frees the memory returned by FS_ReadFile

void FS_WriteFile(const char* qpath, const void* buffer, int size);
// writes a complete file, creating any subdirectories needed

int FS_filelength(fileHandle_t f);
// doesn't work for files that are opened from a pack file

char* FS_BuildOSPath(const char* base, const char* game, const char* qpath);

int FS_FTell(fileHandle_t f);
// where are we?

void FS_Flush(fileHandle_t f);

void QDECL FS_Printf(fileHandle_t f, const char* fmt, ...) PRINTF_LIKE_FUNCTION(2, 3);
// like fprintf

int FS_FOpenFileByMode(const char* qpath, fileHandle_t* f, fsMode_t mode);
// opens a file for reading, writing, or appending depending on the value of mode

int FS_Seek(fileHandle_t f, long offset, int origin);
// seek on a file (doesn't work for zip files!!!!!!!!)

bool FS_FilenameCompare(const char* s1, const char* s2);

const char* FS_GamePureChecksum(void);
// Returns the checksum of the pk3 from which the server loaded the qagame.qvm

const char* FS_LoadedPakNames(void);
const char* FS_LoadedPakChecksums(void);
const char* FS_LoadedPakPureChecksums(void);
// Returns a space separated string containing the checksums of all loaded pk3 files.
// Servers with sv_pure set will get this string and pass it to clients.

const char* FS_ReferencedPakNames(void);
const char* FS_ReferencedPakChecksums(void);
const char* FS_ReferencedPakPureChecksums(void);
// Returns a space separated string containing the checksums of all loaded
// AND referenced pk3 files. Servers with sv_pure set will get this string
// back from clients for pure validation

void FS_ClearPakReferences(int flags);
// clears referenced booleans on loaded pk3s

void FS_PureServerSetReferencedPaks(const char* pakSums, const char* pakNames);
void FS_PureServerSetLoadedPaks(const char* pakSums, const char* pakNames);
// If the string is empty, all data sources will be allowed.
// If not empty, only pk3 files that match one of the space
// separated checksums will be checked for files, with the
// sole exception of .cfg files.

bool FS_idPak(char* pak, char* base);
bool FS_ComparePaks(char* neededpaks, int len, bool dlstring);

/*
==============================================================

Edit fields and command line history/completion

==============================================================
*/

#define MAX_EDIT_LINE 256
typedef struct {
    int cursor;
    int scroll;
    int widthInChars;
    char buffer[MAX_EDIT_LINE];
} field_t;

void Field_Clear(field_t* edit);
void Field_CompleteCommand(field_t* edit);

// returned by Sys_GetProcessorId
#define CPUID_GENERIC 0 // any unrecognized processor

#define CPUID_AXP 0x10

#define CPUID_INTEL_UNSUPPORTED 0x20 // Intel 386/486
#define CPUID_INTEL_PENTIUM 0x21 // Intel Pentium or PPro
#define CPUID_INTEL_MMX 0x22 // Intel Pentium/MMX or P2/MMX
#define CPUID_INTEL_KATMAI 0x23 // Intel Katmai

#define CPUID_AMD_3DNOW 0x30 // AMD K6 3DNOW!

// TTimo
// centralized and cleaned, that's the max string you can send to a Com_Printf / Com_DPrintf (above gets truncated)
#define MAXPRINTMSG 4096

char* CopyString(const char* in);
void Info_Print(const char* s);

void Com_BeginRedirect(char* buffer, int buffersize, void (*flush)(char*));
void Com_EndRedirect(void);
void QDECL Com_Printf(const char* fmt, ...) PRINTF_LIKE_FUNCTION(1, 2);
void QDECL Com_DPrintf(const char* fmt, ...) PRINTF_LIKE_FUNCTION(1, 2);
void QDECL Com_Error(int code, const char* fmt, ...) NORETURN PRINTF_LIKE_FUNCTION(2, 3);
void Com_Quit_f(void) NORETURN;
int Com_EventLoop(void);
int Com_Milliseconds(void); // will be journaled properly
uint32_t Com_BlockChecksum(const void* buffer, size_t length);
uint32_t Com_BlockChecksumKey(const void* buffer, size_t length, int key);
int Com_HashKey(char* string, int maxlen);
int Com_Filter(char* filter, char* name, int casesensitive);
int Com_FilterPath(char* filter, char* name, int casesensitive);
int Com_RealTime(qtime_t* qtime);
bool Com_SafeMode(void);

void Com_StartupVariable(const char* match);
// checks for and removes command line "+set var arg" constructs
// if match is NULL, all set commands will be executed, otherwise
// only a set with the exact name.  Only used during startup.

// com_speeds times
extern int time_game;
extern int time_frontend;
extern int time_backend; // renderer backend time

extern int com_frameTime;
extern int com_frameMsec;

extern bool com_errorEntered;

extern fileHandle_t com_journalFile;
extern fileHandle_t com_journalDataFile;

typedef enum {
    TAG_FREE,
    TAG_GENERAL,
    TAG_BOTLIB,
    TAG_RENDERER,
    TAG_SMALL,
    TAG_STATIC
} memtag_t;

/*

--- low memory ----
server vm
server clipmap
---mark---
renderer initialization (shaders, etc)
UI vm
cgame vm
renderer map
renderer models

---free---

temp file loading
--- high memory ---

*/

#if defined(_DEBUG)
#define ZONE_DEBUG
#endif

#ifdef ZONE_DEBUG
#define Z_TagMalloc(size, tag) Z_TagMallocDebug(size, tag, #size, __FILE__, __LINE__)
#define Z_Malloc(size) Z_MallocDebug(size, #size, __FILE__, __LINE__)
#define S_Malloc(size) S_MallocDebug(size, #size, __FILE__, __LINE__)
void* Z_TagMallocDebug(size_t size, int tag, char* label, char* file, int line); // NOT 0 filled memory
void* Z_MallocDebug(size_t size, char* label, char* file, int line); // returns 0 filled memory
void* S_MallocDebug(size_t size, char* label, char* file, int line); // returns 0 filled memory
#else
void* Z_TagMalloc(size_t size, int tag); // NOT 0 filled memory
void* Z_Malloc(size_t size); // returns 0 filled memory
void* S_Malloc(size_t size); // NOT 0 filled memory only for small allocations
#endif
void Z_Free(void* ptr);
int Z_AvailableMemory(void);
void Z_LogHeap(void);

void Hunk_Clear(void);
void Hunk_ClearToMark(void);
void Hunk_SetMark(void);
bool Hunk_CheckMark(void);
void Hunk_ClearTempMemory(void);
void* Hunk_AllocateTempMemory(size_t size);
void Hunk_FreeTempMemory(void* buf);
int Hunk_MemoryRemaining(void);
void Hunk_Log(void);
void Hunk_Trash(void);

void Com_TouchMemory(void);

// commandLine should not include the executable name (argv[0])
void Com_Init(char* commandLine);
void Com_Frame(void);
void Com_Shutdown(void);

//
// client interface
//
void CL_InitKeyCommands(void);
// the keyboard binding interface must be setup before execing
// config files, but the rest of client startup will happen later

void CL_Init(void);
void CL_Disconnect(bool showMainMenu);
void CL_Shutdown(void);
void CL_Frame(int msec);
bool CL_GameCommand(void);
void CL_KeyEvent(int key, bool down, unsigned time);

void CL_CharEvent(int key);
// char events are for field typing, not game control

void CL_MouseEvent(int dx, int dy, int time);

void CL_JoystickEvent(int axis, int value, int time);

void CL_PacketEvent(netadr_t from, msg_t* msg);

void CL_ConsolePrint(char* text);

void CL_MapLoading(void);
// do a screen update before starting to load a map
// when the server is going to load a new map, the entire hunk
// will be cleared, so the client must shutdown cgame, ui, and
// the renderer

void CL_ForwardCommandToServer(const char* string);
// adds the current command line as a clc_clientCommand to the client message.
// things like godmode, noclip, etc, are commands directed to the server,
// so when they are typed in at the console, they will need to be forwarded.

void CL_ShutdownAll(void);
// shutdown all the client stuff

void CL_FlushMemory(void);
// dump all memory on an error

void CL_StartHunkUsers(void);
// start all the client stuff using the hunk

void Key_WriteBindings(fileHandle_t f);
// for writing the config files

void S_ClearSoundBuffer(void);
// call before filesystem access

void SCR_DebugGraph(float value, int color); // FIXME: move logging to common?

//
// server interface
//
void SV_Init(void);
void SV_Shutdown(char* finalmsg);
void SV_Frame(int msec);
void SV_PacketEvent(netadr_t from, msg_t* msg);
bool SV_GameCommand(void);

//
// UI interface
//
bool UI_GameCommand(void);

/*
==============================================================

NON-PORTABLE SYSTEM SERVICES

==============================================================
*/

typedef enum {
    AXIS_SIDE,
    AXIS_FORWARD,
    AXIS_UP,
    AXIS_ROLL,
    AXIS_YAW,
    AXIS_PITCH,
    MAX_JOYSTICK_AXIS
} joystickAxis_t;

typedef enum {
    SE_NONE = 0, // evTime is still valid
    SE_KEY, // evValue is a key code, evValue2 is the down flag
    SE_CHAR, // evValue is an ascii char
    SE_MOUSE, // evValue and evValue2 are relative signed x / y moves
    SE_JOYSTICK_AXIS, // evValue is an axis number and evValue2 is the current state (-127 to 127)
    SE_PACKET // evPtr is a netadr_t followed by data bytes to evPtrLength
} sysEventType_t;

typedef struct {
    int evTime;
    sysEventType_t evType;
    int evValue, evValue2;
    int evPtrLength; // bytes of data pointed to by evPtr, for journaling
    void* evPtr; // this must be manually freed if not NULL
} sysEvent_t;

sysEvent_t Sys_GetEvent(void);

void Sys_Init(void);

// general development dll loading for virtual machine testing
// fqpath param added 7/20/02 by T.Ray - Sys_LoadDll is only called in vm.c at this time
void* QDECL Sys_LoadDll(const char* name, char* fqpath, vmMainProc* entryPoint, vmDllSystemCall systemCalls);
void Sys_UnloadDll(void* dllHandle);

void Sys_UnloadGame(void);
void* Sys_GetGameAPI(void* parms);

void Sys_UnloadCGame(void);
void* Sys_GetCGameAPI(void);

void Sys_UnloadUI(void);
void* Sys_GetUIAPI(void);

void QDECL Sys_Error(const char* error, ...) NORETURN PRINTF_LIKE_FUNCTION(1, 2);
void Sys_Quit(void) NORETURN;
#ifndef DEDICATED
char* Sys_GetClipboardData(void); // note that this isn't journaled...
#endif

void Sys_Print(const char* msg);

// Sys_Milliseconds should only be used for profiling purposes,
// any game related timing information should come from event timestamps
int Sys_Milliseconds(void);

void Sys_SnapVector(float* v);

int Sys_GetProcessorId(void);

void Sys_SendPacket(int length, const void* data, netadr_t to);

bool Sys_StringToAdr(const char* s, netadr_t* a);
// Does NOT parse port numbers, only base addresses.

bool Sys_IsLANAddress(netadr_t adr);
void Sys_ShowIP(void);

void Sys_Mkdir(const char* path);
char* Sys_Cwd(void);
void Sys_SetDefaultCDPath(const char* path);
char* Sys_DefaultCDPath(void);
void Sys_SetDefaultInstallPath(const char* path);
char* Sys_DefaultInstallPath(void);
void Sys_SetDefaultHomePath(const char* path);
char* Sys_DefaultHomePath(void);

char** Sys_ListFiles(const char* directory, const char* extension, char* filter, int* numfiles, bool wantsubs);
void Sys_FreeFileList(char** list);

/* This is based on the Adaptive Huffman algorithm described in Sayood's Data
 * Compression book.  The ranks are not actually stored, but implicitly defined
 * by the location of a node within a doubly-linked list */

#define NYT HMAX /* NYT = Not Yet Transmitted */
#define INTERNAL_NODE (HMAX + 1)

typedef struct nodetype {
    struct nodetype *left, *right, *parent; /* tree structure */
    struct nodetype *next, *prev; /* doubly-linked list */
    struct nodetype** head; /* highest ranked node in block */
    int weight;
    int symbol;
} node_t;

#define HMAX 256 /* Maximum symbol */

typedef struct {
    int blocNode;
    int blocPtrs;

    node_t* tree;
    node_t* lhead;
    node_t* ltail;
    node_t* loc[HMAX + 1];
    node_t** freelist;

    node_t nodeList[768];
    node_t* nodePtrs[768];
} huff_t;

typedef struct {
    huff_t compressor;
    huff_t decompressor;
} huffman_t;

void Huff_Compress(msg_t* buf, int offset);
void Huff_Decompress(msg_t* buf, int offset);
void Huff_Init(huffman_t* huff);
void Huff_addRef(huff_t* huff, uint8_t ch);
int Huff_Receive(node_t* node, int* ch, uint8_t* fin);
void Huff_transmit(huff_t* huff, int ch, uint8_t* fout);
void Huff_offsetReceive(node_t* node, int* ch, uint8_t* fin, int* offset);
void Huff_offsetTransmit(huff_t* huff, int ch, uint8_t* fout, int* offset);
void Huff_putBit(int bit, uint8_t* fout, int* offset);
int Huff_getBit(uint8_t* fout, int* offset);

#define SV_ENCODE_START 4
#define SV_DECODE_START 12
#define CL_ENCODE_START 12
#define CL_DECODE_START 4

#endif // QCOMMON_H
