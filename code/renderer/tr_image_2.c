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

#include "tr_common.h"
#include "tr_image.h"

#define TGA_EXTENSION "tga"
#define PNG_EXTENSION "png"

qboolean R_LoadImageNew(const char* name, image_load_result_t* result)
{
    void* buffer = NULL;
    qboolean success = qfalse;

    assert(NULL != name);
    assert(NULL != result);

    result->data = NULL;
    result->width = 0;
    result->height = 0;

    const char* original_extension = COM_GetExtension(name);

    // The MD3 files have embedded references to .tga textures which have
    // all been converted to .png files. So we have to identify a request
    // for a file with a .tga extension and treat it as a .png file. It is an ugly hack
    // but is required until we convert the md3 files into a different format
    char local_name[MAX_QPATH];
    const char* extension;
    const char* name_to_request;
    if (0 == Q_stricmpn(original_extension, TGA_EXTENSION, MAX_QPATH)) {
        COM_StripExtension(name, local_name, MAX_QPATH);
        Q_strcat(local_name, MAX_QPATH, PNG_EXTENSION);
        extension = PNG_EXTENSION;
        name_to_request = local_name;
    } else {
        extension = original_extension;
        name_to_request = name;
    }

    const long buffer_size = ri.FS_ReadFile(name_to_request, &buffer);
    if (NULL == buffer || -1 == buffer_size) {
        goto cleanup;
    } else {
        // Decode image by extension in the available loaders
        if (0 == Q_stricmpn(extension, PNG_EXTENSION, MAX_QPATH)) {
            success = R_DecodePngInBuffer(name_to_request, buffer, buffer_size, result);
        } else {
            ri.Printf(PRINT_WARNING, "%s: Failed to decode image file named %s as extension %s is not recognized.\n", __func__, name_to_request, extension);
        }
    }
cleanup:
    if (NULL != buffer) {
        ri.FS_FreeFile(buffer);
    }
    return success;
}
