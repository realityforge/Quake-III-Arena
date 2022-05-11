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
#define JPG_EXTENSION "jpg"

#ifdef ENABLE_DDS_TEXTURES
#define DDS_EXTENSION "dds"
#endif

/**
 * Attempt to load and decode the image with the specified name from the VFS.
 *
 * @param name the name of the file.
 * @param output the output parameter where the function stores details about the image. This parameter will not be modified unless the function succeeds.
 * @return true if the image was successfully loaded and decoded, false otherwise. False may indicate that no such file was present or that it could not be successfully decoded.
 */
static bool try_load_image(const char* name, image_load_result_t* output)
{
    assert(NULL != name);
    assert(NULL != output);

    bool success = false;
    void* buffer = NULL;
    const long buffer_size = ri.FS_ReadFile(name, &buffer);
    if (NULL == buffer || -1 == buffer_size) {
        goto cleanup;
    } else {
        // Decode image by extension in the available loaders
        const char* extension = COM_GetExtension(name);
        if (0 == Q_stricmpn(extension, PNG_EXTENSION, MAX_QPATH)) {
            success = R_DecodePngInBuffer(name, buffer, buffer_size, output);
        } else if (0 == Q_stricmpn(extension, JPG_EXTENSION, MAX_QPATH)) {
            success = R_DecodeJpgInBuffer(name, buffer, buffer_size, output);
        } else {
            ri.Printf(PRINT_WARNING, "%s: Failed to decode image file named %s as extension %s is not recognized.\n", __func__, name, extension);
        }
    }
cleanup:
    if (NULL != buffer) {
        ri.FS_FreeFile(buffer);
    }
    return success;
}

/**
 * Attempt to load and decode the image with the specified name from the VFS.
 * If the name does not have an extension then the function will search for images of any supported format.
 *
 * @param name the name of the file with or without the explicit file extension.
 * @param output the output parameter where the function stores details about the image. This parameter will not be modified unless the function succeeds.
 * @return true if the image was successfully loaded and decoded, false otherwise. False may indicate that no such file was present or that it could not be successfully decoded.
 */
bool R_LoadImage(const char* name, image_load_result_t* output)
{
    assert(NULL != name);
    assert(NULL != pixel_data);
    assert(NULL != width);
    assert(NULL != height);
    assert(NULL != pixel_format);
    assert(NULL != num_mips);

    bool ignored_incoming_extension = false;
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

    const char* name_sans_extension;
    if (*extension) {
        if (true == try_load_image(name_to_request, output)) {
            goto load_complete;
        } else {
            // The engine was requested an image with an explicit extension but no such file is present
            // We remove the extension and try again. Hopefully another variant found and if so we issue
            // a warning below
            COM_StripExtension(name, local_name, MAX_QPATH);
            name_sans_extension = local_name;
            ignored_incoming_extension = true;
        }
    } else {
        name_sans_extension = name;
    }

#ifdef ENABLE_DDS_TEXTURES
    // Only attempt to load DDS compressed textures if enabled
    if (r_ext_compressed_textures->integer) {
        name_to_request = va("%s.%s", name_sans_extension, DDS_EXTENSION);
        // TODO: Rewrite R_LoadDDS to our existing pattern
        R_LoadDDS(name_to_request, &output->data, &output->width, &output->height, &output->pixel_format, &output->num_mips);
        if (*output->data) {
            return true;
        }
    }
#endif

    name_to_request = va("%s.%s", name_sans_extension, PNG_EXTENSION);
    if (true == try_load_image(name_to_request, output)) {
        goto load_complete;
    }

    name_to_request = va("%s.%s", name_sans_extension, JPG_EXTENSION);
    if (true == try_load_image(name_to_request, output)) {
        goto load_complete;
    }

    // Return in "failed" state without image loaded
    return false;

load_complete:
    if (ignored_incoming_extension) {
        ri.Printf(PRINT_WARNING, "WARNING: %s not present, using %s instead\n", name, name_to_request);
    }
    return true;
}
