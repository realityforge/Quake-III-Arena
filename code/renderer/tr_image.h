/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef TR_IMAGE_H
#define TR_IMAGE_H

#include <stdint.h>
#include "SDL_opengl.h"

// TODO: Rather than using GLenum for pixel_format use our
//  own internal enum and then have a LUT in each renderer for
//  constant in particular renderer and also use uint8_t for num_mips

typedef struct image_load_result_s {
    uint8_t* data;
    uint32_t width;
    uint32_t height;
    GLenum pixel_format;
    int num_mips;
} image_load_result_t;

qboolean R_LoadImage(const char* name, image_load_result_t *output);
qboolean R_DecodePngInBuffer(const char* name, const void* buffer, const long buffer_size, image_load_result_t* output);
qboolean R_DecodeJpgInBuffer(const char* name, const void* buffer, const long buffer_size, image_load_result_t* output);

#ifdef ENABLE_DDS_TEXTURES
void R_LoadDDS(const char* name, byte** pixel_data, uint32_t* width, uint32_t* height, GLenum* pixel_format, int* num_mips);
#endif

#endif
