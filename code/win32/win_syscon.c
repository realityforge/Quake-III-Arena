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
// win_syscon.h
#include "../client/client.h"
#include "win_local.h"
#include "resource.h"
#include <errno.h>
#include <float.h>
#include <fcntl.h>
#include <stdio.h>
#include <direct.h>
#include <io.h>
#include <conio.h>

#define COPY_ID 1
#define QUIT_ID 2
#define CLEAR_ID 3

#define ERRORBOX_ID 10
#define ERRORTEXT_ID 11

#define EDIT_ID 100
#define INPUT_ID 101

typedef struct
{
    HWND hWnd;
    HWND hwndBuffer;

    HWND hwndButtonClear;
    HWND hwndButtonCopy;
    HWND hwndButtonQuit;

    HWND hwndErrorBox;
    HWND hwndErrorText;

    HBITMAP hbmLogo;
    HBITMAP hbmClearBitmap;

    HBRUSH hbrEditBackground;
    HBRUSH hbrErrorBackground;

    HFONT hfBufferFont;
    HFONT hfButtonFont;

    HWND hwndInputLine;

    char errorString[80];

    char consoleText[512], returnedText[512];
    int visLevel;
    int windowWidth, windowHeight;

    WNDPROC SysInputLineWndProc;

} WinConData;

static WinConData s_wcd;

static LONG WINAPI ConWndProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    char* cmdString;
    static qboolean s_timePolarity;

    switch (uMsg) {
    case WM_ACTIVATE:
        if (LOWORD(wParam) != WA_INACTIVE) {
            SetFocus(s_wcd.hwndInputLine);
        }
        break;

    case WM_CLOSE:
        PostQuitMessage(0);
        return 0;
    case WM_CTLCOLORSTATIC:
        if ((HWND)lParam == s_wcd.hwndBuffer) {
            SetBkColor((HDC)wParam, RGB(0x00, 0x00, 0xB0));
            SetTextColor((HDC)wParam, RGB(0xff, 0xff, 0x00));

            return (long)s_wcd.hbrEditBackground;
        } else if ((HWND)lParam == s_wcd.hwndErrorBox) {
            if (s_timePolarity & 1) {
                SetBkColor((HDC)wParam, RGB(0x80, 0x80, 0x80));
                SetTextColor((HDC)wParam, RGB(0xff, 0x0, 0x00));
            } else {
                SetBkColor((HDC)wParam, RGB(0x80, 0x80, 0x80));
                SetTextColor((HDC)wParam, RGB(0x00, 0x0, 0x00));
            }
            return (long)s_wcd.hbrErrorBackground;
        }
        break;

    case WM_COMMAND:
        if (wParam == COPY_ID) {
            SendMessage(s_wcd.hwndBuffer, EM_SETSEL, 0, -1);
            SendMessage(s_wcd.hwndBuffer, WM_COPY, 0, 0);
        } else if (wParam == QUIT_ID) {
            PostQuitMessage(0);
        } else if (wParam == CLEAR_ID) {
            SendMessage(s_wcd.hwndBuffer, EM_SETSEL, 0, -1);
            SendMessage(s_wcd.hwndBuffer, EM_REPLACESEL, FALSE, (LPARAM) "");
            UpdateWindow(s_wcd.hwndBuffer);
        }
        break;
    case WM_CREATE:
        //		s_wcd.hbmLogo = LoadBitmap( g_wv.hInstance, MAKEINTRESOURCE( IDB_BITMAP1 ) );
        //		s_wcd.hbmClearBitmap = LoadBitmap( g_wv.hInstance, MAKEINTRESOURCE( IDB_BITMAP2 ) );
        s_wcd.hbrEditBackground = CreateSolidBrush(RGB(0x00, 0x00, 0xB0));
        s_wcd.hbrErrorBackground = CreateSolidBrush(RGB(0x80, 0x80, 0x80));
        SetTimer(hWnd, 1, 1000, NULL);
        break;
    case WM_ERASEBKGND:
        return DefWindowProc(hWnd, uMsg, wParam, lParam);
    case WM_TIMER:
        if (wParam == 1) {
            s_timePolarity = !s_timePolarity;
            if (s_wcd.hwndErrorBox) {
                InvalidateRect(s_wcd.hwndErrorBox, NULL, FALSE);
            }
        }
        break;
    }

    return DefWindowProc(hWnd, uMsg, wParam, lParam);
}

LONG WINAPI InputLineWndProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    char inputBuffer[1024];

    switch (uMsg) {
    case WM_KILLFOCUS:
        if ((HWND)wParam == s_wcd.hWnd || (HWND)wParam == s_wcd.hwndErrorBox) {
            SetFocus(hWnd);
            return 0;
        }
        break;

    case WM_CHAR:
        if (wParam == 13) {
            GetWindowText(s_wcd.hwndInputLine, inputBuffer, sizeof(inputBuffer));
            strncat(s_wcd.consoleText, inputBuffer, sizeof(s_wcd.consoleText) - strlen(s_wcd.consoleText) - 5);
            strcat(s_wcd.consoleText, "\n");
            SetWindowText(s_wcd.hwndInputLine, "");

            Sys_Print(va("]%s\n", inputBuffer));

            return 0;
        }
    }

    return CallWindowProc(s_wcd.SysInputLineWndProc, hWnd, uMsg, wParam, lParam);
}

/*
** Conbuf_AppendText
*/
void Conbuf_AppendText(const char* pMsg)
{
#define CONSOLE_BUFFER_SIZE 16384

    char buffer[CONSOLE_BUFFER_SIZE * 2];
    char* b = buffer;
    const char* msg;
    int bufLen;
    int i = 0;
    static unsigned long s_totalChars;

    //
    // if the message is REALLY long, use just the last portion of it
    //
    if (strlen(pMsg) > CONSOLE_BUFFER_SIZE - 1) {
        msg = pMsg + strlen(pMsg) - CONSOLE_BUFFER_SIZE + 1;
    } else {
        msg = pMsg;
    }

    //
    // copy into an intermediate buffer
    //
    while (msg[i] && ((b - buffer) < sizeof(buffer) - 1)) {
        if (msg[i] == '\n' && msg[i + 1] == '\r') {
            b[0] = '\r';
            b[1] = '\n';
            b += 2;
            i++;
        } else if (msg[i] == '\r') {
            b[0] = '\r';
            b[1] = '\n';
            b += 2;
        } else if (msg[i] == '\n') {
            b[0] = '\r';
            b[1] = '\n';
            b += 2;
        } else if (Q_IsColorString(&msg[i])) {
            i++;
        } else {
            *b = msg[i];
            b++;
        }
        i++;
    }
    *b = 0;
    bufLen = b - buffer;

    s_totalChars += bufLen;

    //
    // replace selection instead of appending if we're overflowing
    //
    if (s_totalChars > 0x7fff) {
        SendMessage(s_wcd.hwndBuffer, EM_SETSEL, 0, -1);
        s_totalChars = bufLen;
    }

    //
    // put this text into the windows console
    //
    SendMessage(s_wcd.hwndBuffer, EM_LINESCROLL, 0, 0xffff);
    SendMessage(s_wcd.hwndBuffer, EM_SCROLLCARET, 0, 0);
    SendMessage(s_wcd.hwndBuffer, EM_REPLACESEL, 0, (LPARAM)buffer);
}

/*
** Sys_SetErrorText
*/
void Sys_SetErrorText(const char* buf)
{
    Q_strncpyz(s_wcd.errorString, buf, sizeof(s_wcd.errorString));

    if (!s_wcd.hwndErrorBox) {
        s_wcd.hwndErrorBox = CreateWindow("static", NULL, WS_CHILD | WS_VISIBLE | SS_SUNKEN,
                                          6, 5, 526, 30,
                                          s_wcd.hWnd,
                                          (HMENU)ERRORBOX_ID, // child window ID
                                          g_wv.hInstance, NULL);
        SendMessage(s_wcd.hwndErrorBox, WM_SETFONT, (WPARAM)s_wcd.hfBufferFont, 0);
        SetWindowText(s_wcd.hwndErrorBox, s_wcd.errorString);

        DestroyWindow(s_wcd.hwndInputLine);
        s_wcd.hwndInputLine = NULL;
    }
}
