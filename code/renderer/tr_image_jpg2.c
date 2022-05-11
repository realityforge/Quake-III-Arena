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

// NOTE: This code is modelled on https://github.com/libjpeg-turbo/libjpeg-turbo/blob/290ddbf71a912644e16f7a21329005e16df4403f/example.txt
// which is under the same license as the rest of the libjpeg-turbo library

#include "tr_common.h"
#include "tr_image.h"
#include "../qcommon/attributes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpadded"
#include "jpeglib.h"
#pragma clang diagnostic push
#include "jerror.h"
#include <setjmp.h>

// Some guesses at reasonable JPG limits. As we are potentially decoding untrusted files, we should
// protect against failures due to excessive memory consumption. If a JPG exceeds these limits then it
// will simply fail to be loaded. Each image will take at most (MAX_READ_JPG_WIDTH x MAX_READ_JPG_HEIGHT x 4 bytes)
#define MAX_READ_JPG_WIDTH 2048
#define MAX_READ_JPG_HEIGHT 2048

// Error handling in libjpeg uses C's setjmp/longjmp facility to return control. This means that the
// routine which calls the JPEG library must first execute a setjmp() call to establish the return point.
// We want the replacement error_exit to do a longjmp(). But we need to make the setjmp buffer accessible
// to the error_exit routine. To do this, we make a private extension of the standard JPEG error handler object.
typedef struct error_mgr_s {
    // The standard error handler structure
    struct jpeg_error_mgr error_handler;
    // The filename that we are attempted to load
    const char* name;
    // the setjump target to return to
    jmp_buf setjmp_buffer;
} error_mgr_t;

static void jpeg_load_error(const char* name, const char* error_message)
{
    ri.Printf(PRINT_WARNING, "Failed to load jpg file named %s due to: %s.\n", name, error_message);
}

NORETURN static void jpeg_load_error_exit(const j_common_ptr info)
{
    // Get our custom error handler
    error_mgr_t* error_mgr = (error_mgr_t*)info->err;

    // Extract the error message from structure
    char jmsg[JMSG_LENGTH_MAX];
    (*info->err->format_message)(info, jmsg);

    jpeg_load_error(error_mgr->name, jmsg);

    // Return control to the setjmp point
    longjmp(error_mgr->setjmp_buffer, 1);
}

static void jpeg_load_output_message(const j_common_ptr info)
{
    error_mgr_t* error_mgr = (error_mgr_t*)info->err;

    char jmsg[JMSG_LENGTH_MAX];
    (*info->err->format_message)(info, jmsg);

    ri.Printf(PRINT_WARNING, "%s: %s.\n", error_mgr->name, jmsg);
}

/**
 * Attempt to decode an image in JPG format from the specified buffer and return the results of encoding in output struct.
 * If the image was successfully decoded then the caller is responsible for releasing image data referenced by output struct.
 *
 * @param name the name of the file that the buffer was loaded from. Used in Error reporting.
 * @param buffer the reference to the buffer.
 * @param buffer_size the size of the buffer in bytes.
 * @param output the structure to populate with decided image details
 * @return qtrue if image was successfully decoded, qfalse if the image failed to be decoded.
 */
qboolean R_DecodeJpgInBuffer(const char* name, const void* buffer, const long buffer_size, image_load_result_t* output)
{
    byte* image = NULL;

    assert(NULL != name);
    assert(NULL != pixel_data);
    assert(NULL != width);
    assert(NULL != height);

    struct jpeg_decompress_struct info = { 0 };
    error_mgr_t error_handler = { .name = name };
    info.err = jpeg_std_error(&error_handler.error_handler);
    info.err->output_message = jpeg_load_output_message;
    info.err->error_exit = jpeg_load_error_exit;

    // Note: We do not override the memory allocation routines in info.mem via jinit_memory_mgr()
    // and thus we are using the os level memory manager and the jpeg libraries allocation which
    // we are just assuming is OK and tested enough that is not a concern

    if (setjmp(error_handler.setjmp_buffer)) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma ide diagnostic ignored "UnreachableCode"
        if (NULL != image) {
            ri.Free(image);
        }
#pragma clang diagnostic pop
        jpeg_destroy_decompress(&info);
        return qfalse;
    }
    // Initialize the JPEG decompression object
    jpeg_create_decompress(&info);
    // Set the source to be our buffer
    jpeg_mem_src(&info, buffer, (unsigned long)buffer_size);

    // As we set require_image=TRUE parameter, and we can not suspend as we use
    // mem src there is no need to check return value
    (void)jpeg_read_header(&info, TRUE);

    // TODO: Convert images to RGB by using JCS_RGB rather than JCS_EXT_RGBA. However to do this we need to
    //  change the resampling and mip-ing code to support 3 component images. See tr_image_png.c for another
    //  place where this feature is required
    const int pixel_format = GL_RGBA8;
    const int expected_components = 4;
    info.out_color_space = JCS_EXT_RGBA;

    // As we can not suspend as we use mem src there is no need to check return value
    (void)jpeg_start_decompress(&info);

    const unsigned int output_components = (unsigned int)info.out_color_components;

    if (0 == info.output_width || info.output_width > MAX_READ_JPG_WIDTH || 0 == info.output_height || info.output_height > MAX_READ_JPG_HEIGHT || expected_components != output_components) {
        ri.Printf(PRINT_WARNING, "Failed to load jpg image named %s due to invalid image dimensions %dx%dx%d.\n", name, info.output_width, info.output_height, info.out_color_components);
        jpeg_destroy_decompress(&info);
        return qfalse;
    }

    const unsigned int row_size = info.output_width * output_components;
    const size_t size = row_size * info.output_height;

    image = ri.Malloc(size);
    if (NULL == image) {
        ri.Printf(PRINT_WARNING, "Failed to load jpg image named %s as unable to allocate %zu bytes of memory.\n", name, size);
        jpeg_destroy_decompress(&info);
        return qfalse;
    }

    while (info.output_scanline < info.output_height) {
        // Read a scanline at a time
        byte* row = ((image + (row_size * (unsigned int)info.output_scanline)));
        (void)jpeg_read_scanlines(&info, &row, 1);
    }

    // As we can not suspend as we use mem src there is no need to check return value
    (void)jpeg_finish_decompress(&info);

    output->width = info.output_width;
    output->height = info.output_height;
    output->data = image;
    output->pixel_format = pixel_format;
    output->num_mips = 0;

    // Clear image so it does not deallocated in cleanup phase
    image = NULL;

    jpeg_destroy_decompress(&info);

    return qtrue;
}
