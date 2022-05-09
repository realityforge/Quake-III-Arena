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

// TODO: Move the required type "byte" and "uint32_t" to a separate header?
#include "../qcommon/q_shared.h"

typedef struct image_load_result_s {
    byte* data;
    uint32_t width;
    uint32_t height;
} image_load_result_t;

qboolean R_DecodePngInBuffer(const char* name, const void* buffer, const long buffer_size, image_load_result_t* image_load_result);

#endif
