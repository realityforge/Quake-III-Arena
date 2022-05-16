/*
===========================================================================
Copyright (C) 2011 James Canete (use.less01@gmail.com)

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
// tr_extensions.c - extensions needed by the renderer not in sdl_glimp.c

#include "SDL.h"

#include "tr_local.h"

void GLimp_InitExtraExtensions(void)
{
    char* extension;
    const char* result[3] = { "...ignoring %s\n", "...using %s\n", "...%s not found\n" };

    // Check if we need Intel graphics specific fixes.
    glRefConfig.intelGraphics = false;
    if (NULL != strstr((char*)glGetString(GL_RENDERER), "Intel")) {
        glRefConfig.intelGraphics = true;
    }

    // OpenGL 3.0 - GL_ARB_framebuffer_object
    extension = "GL_ARB_framebuffer_object";
    glRefConfig.framebufferObject = false;
    glRefConfig.framebufferBlit = false;
    glRefConfig.framebufferMultisample = false;
    if (SDL_GL_ExtensionSupported(extension)) {
        glRefConfig.framebufferObject = !!r_ext_framebuffer_object->integer;
        glRefConfig.framebufferBlit = true;
        glRefConfig.framebufferMultisample = true;

        glGetIntegerv(GL_MAX_RENDERBUFFER_SIZE, &glRefConfig.maxRenderbufferSize);
        glGetIntegerv(GL_MAX_COLOR_ATTACHMENTS, &glRefConfig.maxColorAttachments);

        ri.Printf(PRINT_ALL, result[glRefConfig.framebufferObject], extension);
    } else {
        ri.Printf(PRINT_ALL, result[2], extension);
    }

    glRefConfig.vertexArrayObject = true;
    glRefConfig.textureFloat = !!r_ext_texture_float->integer;

    glRefConfig.depthClamp = GL3W_ARB_depth_clamp;
    ri.Printf(PRINT_ALL, result[glRefConfig.depthClamp ? 1 : 2], "GL_ARB_depth_clamp");

    glRefConfig.seamlessCubeMap = GL3W_ARB_seamless_cube_map;
    ri.Printf(PRINT_ALL, result[glRefConfig.seamlessCubeMap ? 1 : 2], "GL_ARB_seamless_cube_map");

    // Determine GLSL version
    char shading_language_version[256];
    Q_strncpyz(shading_language_version, (char*)glGetString(GL_SHADING_LANGUAGE_VERSION), sizeof(shading_language_version));
    sscanf(shading_language_version, "%d.%d", &glRefConfig.glslMajorVersion, &glRefConfig.glslMinorVersion);
    ri.Printf(PRINT_ALL, "...using GLSL shading_language_version %s\n", shading_language_version);

    glRefConfig.memInfo = GL3W_NVX_gpu_memory_info ? MI_NVX : GL3W_ATI_meminfo ? MI_ATI : MI_NONE;

    ri.Printf(PRINT_ALL, result[glRefConfig.memInfo == MI_NVX ? 1 : 2], "GL_NVX_gpu_memory_info");
    ri.Printf(PRINT_ALL, result[glRefConfig.memInfo == MI_ATI ? 1 : 2], "GL_ATI_meminfo");

    glRefConfig.textureCompression = TCR_NONE;

    if (GL3W_ARB_texture_compression_rgtc) {
        const bool useRgtc = r_ext_compressed_textures->integer >= 1;
        if (useRgtc) {
            glRefConfig.textureCompression |= TCR_RGTC;
        }
        ri.Printf(PRINT_ALL, result[useRgtc], "GL_ARB_texture_compression_rgtc");
    } else {
        ri.Printf(PRINT_ALL, result[2], "GL_ARB_texture_compression_rgtc");
    }

    glRefConfig.swizzleNormalmap = r_ext_compressed_textures->integer && !(glRefConfig.textureCompression & TCR_RGTC);

    if (GL3W_ARB_texture_compression_bptc) {
        const bool useBptc = r_ext_compressed_textures->integer >= 2;
        if (useBptc) {
            glRefConfig.textureCompression |= TCR_BPTC;
        }
        ri.Printf(PRINT_ALL, result[useBptc], "GL_ARB_texture_compression_bptc");
    } else {
        ri.Printf(PRINT_ALL, result[2], "GL_ARB_texture_compression_bptc");
    }
}
