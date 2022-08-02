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

#include "SDL2/SDL.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "../renderer/tr_common.h"
#include "../sys/sys_local.h"
#include "cvar_engine.h"
#include "window_icon_data.h"
#include "window_icon_dimensions.h"

typedef enum {
    RSERR_OK,
    RSERR_INVALID_MODE
} rserr_t;

static SDL_Window* SDL_window = NULL;
static SDL_GLContext SDL_glContext = NULL;

static cvar_t* r_allowResize; // make window resizable
static cvar_t* r_centerWindow;

static void GLimp_DeleteContextIfExists()
{
    if (NULL != SDL_glContext) {
        glaDispose();
        SDL_GL_DeleteContext(SDL_glContext);
        SDL_glContext = NULL;
    }
}

static void GLimp_DestroyWindowIfExists()
{
    // Make sure we clear up the GL context if present
    GLimp_DeleteContextIfExists();

    // Destroy the window if active
    if (NULL != SDL_window) {
        SDL_DestroyWindow(SDL_window);
        SDL_window = NULL;
    }
}

void GLimp_Shutdown()
{
    ri.IN_Shutdown();

    GLimp_DestroyWindowIfExists();

    SDL_QuitSubSystem(SDL_INIT_VIDEO);

    // Clear glConfig it should be re-initialized when we call GLimp_Init() again
    memset(&glConfig, 0, sizeof(glConfig));
}

/*
===============
GLimp_Minimize

Minimize the game so that user is back at the desktop
===============
*/
void GLimp_Minimize()
{
    SDL_MinimizeWindow(SDL_window);
}

static int GLimp_CompareModes(const void* a, const void* b)
{
    const float ASPECT_EPSILON = 0.001f;
    const SDL_Rect* modeA = (const SDL_Rect*)a;
    const SDL_Rect* modeB = (const SDL_Rect*)b;
    float aspectA = (float)modeA->w / (float)modeA->h;
    float aspectB = (float)modeB->w / (float)modeB->h;
    int areaA = modeA->w * modeA->h;
    int areaB = modeB->w * modeB->h;
    float aspectDiffA = fabsf(aspectA - displayAspect);
    float aspectDiffB = fabsf(aspectB - displayAspect);
    float aspectDiffsDiff = aspectDiffA - aspectDiffB;

    if (aspectDiffsDiff > ASPECT_EPSILON)
        return 1;
    else if (aspectDiffsDiff < -ASPECT_EPSILON)
        return -1;
    else
        return areaA - areaB;
}

static void GLimp_DetectAvailableModes()
{
    char buf[MAX_STRING_CHARS] = { 0 };
    SDL_Rect* modes;
    size_t numModes = 0;

    SDL_DisplayMode windowMode;
    int display = SDL_GetWindowDisplayIndex(SDL_window);
    if (display < 0) {
        ri.Printf(PRINT_WARNING, "Couldn't get window display index, no resolutions detected: %s\n", SDL_GetError());
        return;
    }
    const int numSDLModes = SDL_GetNumDisplayModes(display);

    if (SDL_GetWindowDisplayMode(SDL_window, &windowMode) < 0 || numSDLModes <= 0) {
        ri.Printf(PRINT_WARNING, "Couldn't get window display mode, no resolutions detected: %s\n", SDL_GetError());
        return;
    }

    modes = SDL_calloc((size_t)numSDLModes, sizeof(SDL_Rect));
    if (!modes) {
        ri.Error(ERR_FATAL, "Out of memory");
    }

    for (int i = 0; i < numSDLModes; i++) {
        SDL_DisplayMode mode;

        if (SDL_GetDisplayMode(display, i, &mode) < 0)
            continue;

        if (!mode.w || !mode.h) {
            ri.Printf(PRINT_ALL, "Display supports any resolution\n");
            SDL_free(modes);
            return;
        }

        if (windowMode.format != mode.format)
            continue;

        // SDL can give the same resolution with different refresh rates.
        // Only list resolution once.
        size_t j = 0;
        for (j = 0; j < numModes; j++) {
            if (mode.w == modes[j].w && mode.h == modes[j].h)
                break;
        }

        if (j != numModes)
            continue;

        modes[numModes].w = mode.w;
        modes[numModes].h = mode.h;
        numModes++;
    }

    if (numModes > 1)
        qsort(modes, numModes, sizeof(SDL_Rect), GLimp_CompareModes);

    for (size_t i = 0; i < numModes; i++) {
        const char* newModeString = va("%ux%u ", modes[i].w, modes[i].h);

        if (strlen(newModeString) < (int)sizeof(buf) - strlen(buf))
            Q_strcat(buf, sizeof(buf), newModeString);
        else
            ri.Printf(PRINT_WARNING, "Skipping mode %ux%u, buffer too small\n", modes[i].w, modes[i].h);
    }

    if (*buf) {
        buf[strlen(buf) - 1] = 0;
        ri.Printf(PRINT_ALL, "Available modes: '%s'\n", buf);
        ri.Cvar_Set("r_availableModes", buf);
    }
    SDL_free(modes);
}

void GLimp_SetGamma(unsigned char red[256], unsigned char green[256], unsigned char blue[256])
{
    if (!glConfig.deviceSupportsGamma || r_ignorehwgamma->integer > 0)
        return;

    Uint16 table[3][256];
    for (int i = 0; i < 256; i++) {
        table[0][i] = (Uint16)(((Uint16)red[i]) << (Uint16)8U) | (Uint16)red[i];
        table[1][i] = (Uint16)(((Uint16)green[i]) << (Uint16)8U) | (Uint16)green[i];
        table[2][i] = (Uint16)(((Uint16)blue[i]) << (Uint16)8U) | (Uint16)blue[i];
    }

#ifdef _WIN32
#include <windows.h>

    // Win2K and newer put this odd restriction on gamma ramps...
    {
        OSVERSIONINFO vinfo;

        vinfo.dwOSVersionInfoSize = sizeof(vinfo);
        GetVersionEx(&vinfo);
        if (vinfo.dwMajorVersion >= 5 && vinfo.dwPlatformId == VER_PLATFORM_WIN32_NT) {
            ri.Printf(PRINT_DEVELOPER, "performing gamma clamp.\n");
            for (j = 0; j < 3; j++) {
                for (i = 0; i < 128; i++) {
                    if (table[j][i] > ((128 + i) << 8))
                        table[j][i] = (128 + i) << 8;
                }

                if (table[j][127] > 254 << 8)
                    table[j][127] = 254 << 8;
            }
        }
    }
#endif

    // enforce constantly increasing
    for (int j = 0; j < 3; j++) {
        for (int i = 1; i < 256; i++) {
            if (table[j][i] < table[j][i - 1])
                table[j][i] = table[j][i - 1];
        }
    }

    if (SDL_SetWindowGammaRamp(SDL_window, table[0], table[1], table[2]) < 0) {
        ri.Printf(PRINT_DEVELOPER, "SDL_SetWindowGammaRamp() failed: %s\n", SDL_GetError());
    }
}

static rserr_t GLimp_SetMode(const int mode, const bool fullscreen, const bool noborder)
{
    const char* glstring;
    int perChannelColorBits;
    int colorBits, depthBits, stencilBits;
    int samples;
    int i;
    Uint32 flags = SDL_WINDOW_SHOWN | SDL_WINDOW_OPENGL;
    SDL_DisplayMode desktopMode;
    int display = 0;

    ri.Printf(PRINT_ALL, "Initializing OpenGL display\n");

    if (r_allowResize->integer)
        flags |= SDL_WINDOW_RESIZABLE;

    SDL_ClearError();
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wcast-qual"
    SDL_Surface* icon = SDL_CreateRGBSurfaceFrom(
        (void*)MagickImage,
        (int)MagickImageWidth,
        (int)MagickImageHeight,
        32 /* 4 components per pixel, 8 bits per component */,
        4 * (int)MagickImageWidth /* 4 components per pixel * image width */,
#ifdef Q3_LITTLE_ENDIAN
        0x000000FF, 0x0000FF00, 0x00FF0000, 0xFF000000
#else
        0xFF000000, 0x00FF0000, 0x0000FF00, 0x000000FF
#endif
    );
#pragma clang diagnostic pop
    if (NULL == icon) {
        ri.Printf(PRINT_ALL, "Error loading Window Icon: %s\n", SDL_GetError());
    }

    // If a window exists, note its display index
    if (NULL != SDL_window) {
        display = SDL_GetWindowDisplayIndex(SDL_window);
        if (display < 0) {
            ri.Printf(PRINT_DEVELOPER, "SDL_GetWindowDisplayIndex() failed: %s\n", SDL_GetError());
        }
    }

    if (display >= 0 && SDL_GetDesktopDisplayMode(display, &desktopMode) == 0) {
        displayAspect = (float)desktopMode.w / (float)desktopMode.h;

        ri.Printf(PRINT_ALL, "Display aspect: %.3f\n", (double)displayAspect);
    } else {
        memset(&desktopMode, 0, sizeof(SDL_DisplayMode));

        ri.Printf(PRINT_ALL, "Cannot determine display aspect, assuming 1.333\n");
    }

    ri.Printf(PRINT_ALL, "...setting mode %d:", mode);

    if (-2 == mode) {
        // use desktop video resolution
        if (desktopMode.h > 0) {
            glConfig.vidWidth = desktopMode.w;
            glConfig.vidHeight = desktopMode.h;
        } else {
            glConfig.vidWidth = 640;
            glConfig.vidHeight = 480;
            ri.Printf(PRINT_ALL, "Cannot determine display resolution, assuming 640x480\n");
        }

        glConfig.windowAspect = (float)glConfig.vidWidth / (float)glConfig.vidHeight;
    } else if (!R_GetModeInfo(&glConfig.vidWidth, &glConfig.vidHeight, &glConfig.windowAspect, mode)) {
        ri.Printf(PRINT_ALL, " invalid mode\n");
        return RSERR_INVALID_MODE;
    }
    ri.Printf(PRINT_ALL, " %d %d\n", glConfig.vidWidth, glConfig.vidHeight);

    int x = SDL_WINDOWPOS_UNDEFINED;
    int y = SDL_WINDOWPOS_UNDEFINED;
    if (NULL != SDL_window) {
        SDL_GetWindowPosition(SDL_window, &x, &y);
    } else if (r_centerWindow->integer && !fullscreen) {
        // Center window
        x = (desktopMode.w / 2) - (glConfig.vidWidth / 2);
        y = (desktopMode.h / 2) - (glConfig.vidHeight / 2);
    }

    GLimp_DestroyWindowIfExists();

    if (fullscreen) {
        flags |= SDL_WINDOW_FULLSCREEN;
        glConfig.isFullscreen = true;
    } else {
        if (noborder)
            flags |= SDL_WINDOW_BORDERLESS;

        glConfig.isFullscreen = false;
    }

    colorBits = r_colorbits->integer;
    if ((!colorBits) || (colorBits >= 32))
        colorBits = 24;

    if (!r_depthbits->integral)
        depthBits = 24;
    else
        depthBits = r_depthbits->integer;

    stencilBits = r_stencilbits->integer;
    samples = r_ext_multisample->integer;

    for (i = 0; i < 16; i++) {
        int testColorBits, testDepthBits, testStencilBits;
        int realColorBits[3];

        // 0 - default
        // 1 - minus colorBits
        // 2 - minus depthBits
        // 3 - minus stencil
        if ((i % 4) == 0 && i) {
            // one pass, reduce
            switch (i / 4) {
            case 2:
                if (colorBits == 24)
                    colorBits = 16;
                break;
            case 1:
                if (depthBits == 24)
                    depthBits = 16;
                else if (depthBits == 16)
                    depthBits = 8;
            case 3:
                if (stencilBits == 24)
                    stencilBits = 16;
                else if (stencilBits == 16)
                    stencilBits = 8;
            }
        }

        testColorBits = colorBits;
        testDepthBits = depthBits;
        testStencilBits = stencilBits;

        if ((i % 4) == 3) { // reduce colorBits
            if (testColorBits == 24)
                testColorBits = 16;
        }

        if ((i % 4) == 2) { // reduce depthBits
            if (testDepthBits == 24)
                testDepthBits = 16;
            else if (testDepthBits == 16)
                testDepthBits = 8;
        }

        if ((i % 4) == 1) { // reduce stencilBits
            if (testStencilBits == 24)
                testStencilBits = 16;
            else if (testStencilBits == 16)
                testStencilBits = 8;
            else
                testStencilBits = 0;
        }

        if (testColorBits == 24)
            perChannelColorBits = 8;
        else
            perChannelColorBits = 4;

        SDL_GL_SetAttribute(SDL_GL_RED_SIZE, perChannelColorBits);
        SDL_GL_SetAttribute(SDL_GL_GREEN_SIZE, perChannelColorBits);
        SDL_GL_SetAttribute(SDL_GL_BLUE_SIZE, perChannelColorBits);
        SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, testDepthBits);
        SDL_GL_SetAttribute(SDL_GL_STENCIL_SIZE, testStencilBits);

        SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, samples ? 1 : 0);
        SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, samples);

        if (r_stereoEnabled->integer) {
            glConfig.stereoEnabled = true;
            SDL_GL_SetAttribute(SDL_GL_STEREO, 1);
        } else {
            glConfig.stereoEnabled = false;
            SDL_GL_SetAttribute(SDL_GL_STEREO, 0);
        }

        SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);

        if (NULL == (SDL_window = SDL_CreateWindow(CLIENT_WINDOW_TITLE, x, y, glConfig.vidWidth, glConfig.vidHeight, flags))) {
            ri.Printf(PRINT_DEVELOPER, "SDL_CreateWindow failed: %s\n", SDL_GetError());
            continue;
        }

        if (fullscreen) {
            SDL_DisplayMode display_mode;

            switch (testColorBits) {
            case 16:
                display_mode.format = SDL_PIXELFORMAT_RGB565;
                break;
            case 24:
                display_mode.format = SDL_PIXELFORMAT_RGB24;
                break;
            default:
                ri.Printf(PRINT_DEVELOPER, "testColorBits is %d, can't fullscreen\n", testColorBits);
                continue;
            }

            display_mode.w = glConfig.vidWidth;
            display_mode.h = glConfig.vidHeight;
            display_mode.refresh_rate = glConfig.displayFrequency = ri.Cvar_VariableIntegerValue("r_displayRefresh");
            display_mode.driverdata = NULL;

            if (SDL_SetWindowDisplayMode(SDL_window, &display_mode) < 0) {
                ri.Printf(PRINT_DEVELOPER, "SDL_SetWindowDisplayMode failed: %s\n", SDL_GetError());
                continue;
            }
        }

        if (NULL != icon) {
            SDL_SetWindowIcon(SDL_window, icon);
        }

        int profileMask, majorVersion, minorVersion;
        SDL_GL_GetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, &profileMask);
        SDL_GL_GetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, &majorVersion);
        SDL_GL_GetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, &minorVersion);

        ri.Printf(PRINT_ALL, "Trying to get an OpenGL 3.2 core context\n");
        SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
        SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
        SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 2);
        if ((SDL_glContext = SDL_GL_CreateContext(SDL_window)) == NULL) {
            ri.Printf(PRINT_ALL, "SDL_GL_CreateContext failed: %s\n", SDL_GetError());
            ri.Printf(PRINT_ALL, "Reverting to default context\n");

            SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, profileMask);
            SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, majorVersion);
            SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, minorVersion);
        } else {
            const char* renderer;

            ri.Printf(PRINT_ALL, "SDL_GL_CreateContext succeeded.\n");

            const int result = glaInit();
            if (GLA_OK == result) {
                renderer = (const char*)glGetString(GL_RENDERER);
            } else {
                const char* error_message = glaError();
                ri.Printf(PRINT_ALL, "glaInit() failed with error %d: %s\n", result, NULL == error_message ? "unknown reason" : error_message);
                renderer = NULL;
            }

            if (!renderer) {
                GLimp_DeleteContextIfExists();

                SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, profileMask);
                SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, majorVersion);
                SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, minorVersion);
            }
        }

        if (!SDL_glContext) {
            if ((SDL_glContext = SDL_GL_CreateContext(SDL_window)) == NULL) {
                ri.Printf(PRINT_DEVELOPER, "SDL_GL_CreateContext failed: %s\n", SDL_GetError());
                SDL_DestroyWindow(SDL_window);
                SDL_window = NULL;
                continue;
            }

            const int result = glaInit();
            if (GLA_OK != result) {
                const char* error_message = glaError();
                ri.Printf(PRINT_ALL, "glaInit() failed with error %d: %s\n", result, NULL == error_message ? "unknown reason" : error_message);
                GLimp_DestroyWindowIfExists();
                continue;
            }
        }

        glClearColor(0, 0, 0, 1);
        glClear(GL_COLOR_BUFFER_BIT);
        SDL_GL_SwapWindow(SDL_window);

        if (SDL_GL_SetSwapInterval(r_swapInterval->integer) == -1) {
            ri.Printf(PRINT_DEVELOPER, "SDL_GL_SetSwapInterval failed: %s\n", SDL_GetError());
        }

        SDL_GL_GetAttribute(SDL_GL_RED_SIZE, &realColorBits[0]);
        SDL_GL_GetAttribute(SDL_GL_GREEN_SIZE, &realColorBits[1]);
        SDL_GL_GetAttribute(SDL_GL_BLUE_SIZE, &realColorBits[2]);
        SDL_GL_GetAttribute(SDL_GL_DEPTH_SIZE, &glConfig.depthBits);
        SDL_GL_GetAttribute(SDL_GL_STENCIL_SIZE, &glConfig.stencilBits);

        glConfig.colorBits = realColorBits[0] + realColorBits[1] + realColorBits[2];

        ri.Printf(PRINT_ALL, "Using %d color bits, %d depth, %d stencil display.\n",
                  glConfig.colorBits, glConfig.depthBits, glConfig.stencilBits);
        break;
    }

    SDL_FreeSurface(icon);

    if (NULL == SDL_window) {
        ri.Printf(PRINT_ALL, "Couldn't get a visual\n");
        return RSERR_INVALID_MODE;
    }

    GLimp_DetectAvailableModes();

    glstring = (const char*)glGetString(GL_RENDERER);
    ri.Printf(PRINT_ALL, "GL_RENDERER: %s\n", glstring);

    return RSERR_OK;
}

static bool GLimp_StartDriverAndSetMode(const int mode, bool fullscreen, const bool noborder)
{
    if (!SDL_WasInit(SDL_INIT_VIDEO)) {
        const char* driverName;

        if (SDL_Init(SDL_INIT_VIDEO) != 0) {
            ri.Printf(PRINT_ALL, "SDL_Init( SDL_INIT_VIDEO ) FAILED (%s)\n", SDL_GetError());
            return false;
        }

        driverName = SDL_GetCurrentVideoDriver();
        ri.Printf(PRINT_ALL, "SDL using driver \"%s\"\n", driverName);
    }

    if (fullscreen && ri.Cvar_VariableIntegerValue("in_nograb")) {
        ri.Printf(PRINT_ALL, "Fullscreen not allowed with in_nograb 1\n");
        ri.Cvar_Set("r_fullscreen", "0");
        r_fullscreen->modified = false;
        fullscreen = false;
    }

    const rserr_t err = GLimp_SetMode(mode, fullscreen, noborder);
    if (RSERR_INVALID_MODE == err) {
        ri.Printf(PRINT_ALL, "...WARNING: could not set the given mode (%d)\n", mode);
        return false;
    } else {
        return true;
    }
}

#define R_MODE_FALLBACK 3 // 640 * 480

/*
===============
GLimp_Init

This routine is responsible for initializing the OS specific portions
of OpenGL
===============
*/
void GLimp_Init()
{
    ri.Printf(PRINT_DEVELOPER, "Glimp_Init( )\n");

    r_allowResize = ri.Cvar_Get("r_allowResize", "0", CVAR_ARCHIVE | CVAR_LATCH);
    r_centerWindow = ri.Cvar_Get("r_centerWindow", "0", CVAR_ARCHIVE | CVAR_LATCH);

    // Create the window and set up the context
    if (GLimp_StartDriverAndSetMode(r_mode->integer, r_fullscreen->integer, r_noborder->integer)) {
        goto success;
    } else if (GLimp_StartDriverAndSetMode(r_mode->integer, r_fullscreen->integer, false)) {
        goto success;
    } else if (R_MODE_FALLBACK != r_mode->integer) {
        // Finally, try the default screen resolution
        ri.Printf(PRINT_ALL, "Setting r_mode %d failed, falling back on r_mode %d\n", r_mode->integer, R_MODE_FALLBACK);
        if (GLimp_StartDriverAndSetMode(R_MODE_FALLBACK, false, false)) {
            goto success;
        }
    }

    // Nothing worked, give up
    ri.Error(ERR_FATAL, "GLimp_Init() - could not load OpenGL subsystem");

success:

    // Only using SDL_SetWindowBrightness to determine if hardware gamma is supported
    glConfig.deviceSupportsGamma = !r_ignorehwgamma->integer && SDL_SetWindowBrightness(SDL_window, 1.0f) >= 0;

    // get our config strings
    Q_strncpyz(glConfig.vendor_string, (const char*)glGetString(GL_VENDOR), sizeof(glConfig.vendor_string));
    Q_strncpyz(glConfig.renderer_string, (const char*)glGetString(GL_RENDERER), sizeof(glConfig.renderer_string));
    if (*glConfig.renderer_string && glConfig.renderer_string[strlen(glConfig.renderer_string) - 1] == '\n')
        glConfig.renderer_string[strlen(glConfig.renderer_string) - 1] = 0;
    Q_strncpyz(glConfig.version_string, (const char*)glGetString(GL_VERSION), sizeof(glConfig.version_string));

    // manually create extension list if using OpenGL 3
    if (glaFunctions.function.GetStringi) {
        int i, numExtensions;
        size_t listLength;
        size_t extensionLength;
        const char* extension;

        glGetIntegerv(GL_NUM_EXTENSIONS, &numExtensions);
        listLength = 0;

        for (i = 0; i < numExtensions; i++) {
            extension = (const char*)glGetStringi(GL_EXTENSIONS, i);
            extensionLength = strlen(extension);

            if ((listLength + extensionLength + 1) >= sizeof(glConfig.extensions_string))
                break;

            if (i > 0) {
                Q_strcat(glConfig.extensions_string, sizeof(glConfig.extensions_string), " ");
                listLength++;
            }

            Q_strcat(glConfig.extensions_string, sizeof(glConfig.extensions_string), extension);
            listLength += extensionLength;
        }
    } else {
        Q_strncpyz(glConfig.extensions_string, (const char*)glGetString(GL_EXTENSIONS), sizeof(glConfig.extensions_string));
    }

    ri.Cvar_Get("r_availableModes", "", CVAR_ROM);

    // This depends on SDL_INIT_VIDEO, hence having it here
    ri.IN_Init(SDL_window);
}

/*
===============
GLimp_EndFrame

Responsible for doing a swapbuffers
===============
*/
void GLimp_EndFrame()
{
    // don't flip if drawing to front buffer
    if (Q_stricmp(r_drawBuffer->string, "GL_FRONT") != 0) {
        SDL_GL_SwapWindow(SDL_window);
    }

    if (r_fullscreen->modified) {
        int fullscreen;
        bool needToToggle;
        bool sdlToggled;

        // Find out the current state
        fullscreen = !!(SDL_GetWindowFlags(SDL_window) & SDL_WINDOW_FULLSCREEN);

        if (r_fullscreen->integer && ri.Cvar_VariableIntegerValue("in_nograb")) {
            ri.Printf(PRINT_ALL, "Fullscreen not allowed with in_nograb 1\n");
            ri.Cvar_Set("r_fullscreen", "0");
            r_fullscreen->modified = false;
        }

        // Is the state we want different from the current state?
        needToToggle = !!r_fullscreen->integer != fullscreen;

        if (needToToggle) {
            sdlToggled = SDL_SetWindowFullscreen(SDL_window, r_fullscreen->integer ? SDL_WINDOW_FULLSCREEN : 0U) >= 0;

            // SDL_WM_ToggleFullScreen didn't work, so do it the slow way
            if (!sdlToggled)
                ri.Cmd_ExecuteText(EXEC_APPEND, "vid_restart\n");

            ri.IN_Restart();
        }

        r_fullscreen->modified = false;
    }
}
