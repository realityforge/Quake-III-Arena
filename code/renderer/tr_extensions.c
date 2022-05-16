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
#include "tr_dsa.h"

void GLimp_InitExtraExtensions(void)
{
    char* extension;
    const char* result[3] = { "...ignoring %s\n", "...using %s\n", "...%s not found\n" };
    bool q_gl_version_at_least_3_2 = gl3wIsSupported(3, 2);

    // Check if we need Intel graphics specific fixes.
    glRefConfig.intelGraphics = false;
    if (NULL != strstr((char*)glGetString(GL_RENDERER), "Intel")) {
        glRefConfig.intelGraphics = true;
    }

    // set DSA fallbacks
#define DSA_FALLBACK(name)       \
    if (NULL == gl##name) {      \
        gl##name = GLDSA_##name; \
    }
    DSA_FALLBACK(BindMultiTextureEXT)
    DSA_FALLBACK(TextureParameterfEXT)
    DSA_FALLBACK(TextureParameteriEXT)
    DSA_FALLBACK(TextureImage2DEXT)
    DSA_FALLBACK(TextureSubImage2DEXT)
    DSA_FALLBACK(CopyTextureSubImage2DEXT)
    DSA_FALLBACK(CompressedTextureImage2DEXT)
    DSA_FALLBACK(CompressedTextureSubImage2DEXT)
    DSA_FALLBACK(GenerateTextureMipmapEXT)
    DSA_FALLBACK(ProgramUniform1iEXT)
    DSA_FALLBACK(ProgramUniform1fEXT)
    DSA_FALLBACK(ProgramUniform2fEXT)
    DSA_FALLBACK(ProgramUniform3fEXT)
    DSA_FALLBACK(ProgramUniform4fEXT)
    DSA_FALLBACK(ProgramUniform1fvEXT)
    DSA_FALLBACK(ProgramUniformMatrix4fvEXT)
    DSA_FALLBACK(NamedRenderbufferStorageEXT)
    DSA_FALLBACK(NamedRenderbufferStorageMultisampleEXT)
    DSA_FALLBACK(CheckNamedFramebufferStatusEXT)
    DSA_FALLBACK(NamedFramebufferTexture2DEXT)
    DSA_FALLBACK(NamedFramebufferRenderbufferEXT)

    // OpenGL 1.5 - GL_ARB_occlusion_query
    glRefConfig.occlusionQuery = true;

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

    // OpenGL 3.2 - GL_ARB_depth_clamp
    extension = "GL_ARB_depth_clamp";
    glRefConfig.depthClamp = false;
    if (q_gl_version_at_least_3_2 || SDL_GL_ExtensionSupported(extension)) {
        glRefConfig.depthClamp = true;

        ri.Printf(PRINT_ALL, result[glRefConfig.depthClamp], extension);
    } else {
        ri.Printf(PRINT_ALL, result[2], extension);
    }

    // OpenGL 3.2 - GL_ARB_seamless_cube_map
    extension = "GL_ARB_seamless_cube_map";
    glRefConfig.seamlessCubeMap = false;
    if (q_gl_version_at_least_3_2 || SDL_GL_ExtensionSupported(extension)) {
        glRefConfig.seamlessCubeMap = !!r_arb_seamless_cube_map->integer;

        ri.Printf(PRINT_ALL, result[glRefConfig.seamlessCubeMap], extension);
    } else {
        ri.Printf(PRINT_ALL, result[2], extension);
    }

    // Determine GLSL version
    char shading_language_version[256];
    Q_strncpyz(shading_language_version, (char*)glGetString(GL_SHADING_LANGUAGE_VERSION), sizeof(shading_language_version));
    sscanf(shading_language_version, "%d.%d", &glRefConfig.glslMajorVersion, &glRefConfig.glslMinorVersion);
    ri.Printf(PRINT_ALL, "...using GLSL shading_language_version %s\n", shading_language_version);

    glRefConfig.memInfo = MI_NONE;

    // GL_NVX_gpu_memory_info
    extension = "GL_NVX_gpu_memory_info";
    if (SDL_GL_ExtensionSupported(extension)) {
        glRefConfig.memInfo = MI_NVX;

        ri.Printf(PRINT_ALL, result[1], extension);
    } else {
        ri.Printf(PRINT_ALL, result[2], extension);
    }

    // GL_ATI_meminfo
    extension = "GL_ATI_meminfo";
    if (SDL_GL_ExtensionSupported(extension)) {
        if (glRefConfig.memInfo == MI_NONE) {
            glRefConfig.memInfo = MI_ATI;

            ri.Printf(PRINT_ALL, result[1], extension);
        } else {
            ri.Printf(PRINT_ALL, result[0], extension);
        }
    } else {
        ri.Printf(PRINT_ALL, result[2], extension);
    }

    glRefConfig.textureCompression = TCR_NONE;

    // GL_ARB_texture_compression_rgtc
    extension = "GL_ARB_texture_compression_rgtc";
    if (SDL_GL_ExtensionSupported(extension)) {
        const bool useRgtc = r_ext_compressed_textures->integer >= 1;
        if (useRgtc) {
            glRefConfig.textureCompression |= TCR_RGTC;
        }

        ri.Printf(PRINT_ALL, result[useRgtc], extension);
    } else {
        ri.Printf(PRINT_ALL, result[2], extension);
    }

    glRefConfig.swizzleNormalmap = r_ext_compressed_textures->integer && !(glRefConfig.textureCompression & TCR_RGTC);

    // GL_ARB_texture_compression_bptc
    extension = "GL_ARB_texture_compression_bptc";
    if (SDL_GL_ExtensionSupported(extension)) {
        const bool useBptc = r_ext_compressed_textures->integer >= 2;
        if (useBptc) {
            glRefConfig.textureCompression |= TCR_BPTC;
        }
        ri.Printf(PRINT_ALL, result[useBptc], extension);
    } else {
        ri.Printf(PRINT_ALL, result[2], extension);
    }
}
