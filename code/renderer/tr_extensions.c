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

#include "tr_local.h"

#define EXT_IGNORE_MESSAGE "...ignoring %s\n"
#define EXT_USING_MESSAGE "...using %s\n"
#define EXT_NOT_FOUND_MESSAGE "...%s not found\n"

void GLimp_InitExtraExtensions()
{
    // Check if we need Intel graphics specific fixes.
    glRefConfig.intelGraphics = false;
    if (NULL != strstr((char*)glGetString(GL_RENDERER), "Intel")) {
        glRefConfig.intelGraphics = true;
    }

    glRefConfig.framebufferObject = GLA_VERSION_3_2 && GLA_ARB_framebuffer_object && !!r_ext_framebuffer_object->integer;

    glGetIntegerv(GL_MAX_RENDERBUFFER_SIZE, &glRefConfig.maxRenderbufferSize);
    glGetIntegerv(GL_MAX_COLOR_ATTACHMENTS, &glRefConfig.maxColorAttachments);

    ri.Printf(PRINT_ALL, glRefConfig.framebufferObject ? EXT_IGNORE_MESSAGE : EXT_USING_MESSAGE, "GL_ARB_framebuffer_object");

    glRefConfig.vertexArrayObject = true;
    glRefConfig.textureFloat = !!r_ext_texture_float->integer;

    glRefConfig.depthClamp = GLA_ARB_depth_clamp;
    ri.Printf(PRINT_ALL, glRefConfig.depthClamp ? EXT_USING_MESSAGE : EXT_NOT_FOUND_MESSAGE, "GL_ARB_depth_clamp");

    glRefConfig.seamlessCubeMap = GLA_ARB_seamless_cube_map;
    ri.Printf(PRINT_ALL, glRefConfig.seamlessCubeMap ? EXT_USING_MESSAGE : EXT_NOT_FOUND_MESSAGE, "GL_ARB_seamless_cube_map");

    // Determine GLSL version
    char shading_language_version[256];
    Q_strncpyz(shading_language_version, (char*)glGetString(GL_SHADING_LANGUAGE_VERSION), sizeof(shading_language_version));
    sscanf(shading_language_version, "%d.%d", &glRefConfig.glslMajorVersion, &glRefConfig.glslMinorVersion);
    ri.Printf(PRINT_ALL, "...using GLSL shading_language_version %s\n", shading_language_version);

    glRefConfig.memInfo = GLA_NVX_gpu_memory_info ? MI_NVX : GLA_ATI_meminfo ? MI_ATI
                                                                             : MI_NONE;

    ri.Printf(PRINT_ALL, glRefConfig.memInfo == MI_NVX ? EXT_USING_MESSAGE : EXT_NOT_FOUND_MESSAGE, "GL_NVX_gpu_memory_info");
    ri.Printf(PRINT_ALL, glRefConfig.memInfo == MI_ATI ? EXT_USING_MESSAGE : EXT_NOT_FOUND_MESSAGE, "GL_ATI_meminfo");

    glRefConfig.textureCompression = TCR_NONE;

    if (GLA_ARB_texture_compression_rgtc) {
        const bool useRgtc = r_ext_compressed_textures->integer >= 1;
        if (useRgtc) {
            glRefConfig.textureCompression |= TCR_RGTC;
        }
        ri.Printf(PRINT_ALL, useRgtc ? EXT_IGNORE_MESSAGE : EXT_USING_MESSAGE, "GL_ARB_texture_compression_rgtc");
    } else {
        ri.Printf(PRINT_ALL, EXT_NOT_FOUND_MESSAGE, "GL_ARB_texture_compression_rgtc");
    }

    glRefConfig.swizzleNormalmap = r_ext_compressed_textures->integer && !(glRefConfig.textureCompression & TCR_RGTC);

    if (GLA_ARB_texture_compression_bptc) {
        const bool useBptc = r_ext_compressed_textures->integer >= 2;
        if (useBptc) {
            glRefConfig.textureCompression |= TCR_BPTC;
        }
        ri.Printf(PRINT_ALL, useBptc ? EXT_IGNORE_MESSAGE : EXT_USING_MESSAGE, "GL_ARB_texture_compression_bptc");
    } else {
        ri.Printf(PRINT_ALL, EXT_NOT_FOUND_MESSAGE, "GL_ARB_texture_compression_bptc");
    }

    glConfig.textureCompression = TC_NONE;

    // GL_EXT_texture_compression_s3tc
    if (GLA_EXT_texture_compression_s3tc) {
        if (r_ext_compressed_textures->value) {
            glConfig.textureCompression = TC_S3TC;
            ri.Printf(PRINT_ALL, EXT_USING_MESSAGE, "GL_EXT_texture_compression_s3tc");
        } else {
            ri.Printf(PRINT_ALL, EXT_IGNORE_MESSAGE, "GL_EXT_texture_compression_s3tc");
        }
    } else {
        ri.Printf(PRINT_ALL, EXT_NOT_FOUND_MESSAGE, "GL_EXT_texture_compression_s3tc");
    }

    glConfig.textureFilterAnisotropic = false;
    if (GLA_EXT_texture_filter_anisotropic) {
        if (r_ext_texture_filter_anisotropic->integer) {
            glGetIntegerv(GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT, (GLint*)&glConfig.maxAnisotropy);
            if (glConfig.maxAnisotropy <= 0) {
                ri.Printf(PRINT_ALL, "...GL_EXT_texture_filter_anisotropic not properly supported!\n");
                glConfig.maxAnisotropy = 0;
            } else {
                ri.Printf(PRINT_ALL, "...using GL_EXT_texture_filter_anisotropic (max: %i)\n", glConfig.maxAnisotropy);
                glConfig.textureFilterAnisotropic = true;
            }
        } else {
            ri.Printf(PRINT_ALL, EXT_IGNORE_MESSAGE, "GL_EXT_texture_filter_anisotropic");
        }
    } else {
        ri.Printf(PRINT_ALL, EXT_NOT_FOUND_MESSAGE, "GL_EXT_texture_filter_anisotropic");
    }
}
