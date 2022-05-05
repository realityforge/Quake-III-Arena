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
#include <spng.h>

// Some guesses at reasonable PNG limits. As we are potentially decoding untrusted files, we should
// protect against failures due to excessive memory consumption. If a PNG exceeds these limits then it
// will simply fail to be loaded. Each image will take at most (MAX_READ_PNG_WIDTH x MAX_READ_PNG_HEIGHT
#define MAX_READ_PNG_WIDTH 2048
#define MAX_READ_PNG_HEIGHT 2048

// These are controlled by the size of the users screen resolution so we allow larger values. We could
// probably use defaults that are extracted from max screen resolution in the future but hard coding
// works for now
#define MAX_WRITE_PNG_WIDTH 4096
#define MAX_WRITE_PNG_HEIGHT 4096

// Set memory usage limits for storing standard and unknown chunks, this is important when reading untrusted files!
// No real thought has gone into what these should be set to so taking some (reasonable?) values from the upstream
// library's documentation/examples.
#define MAX_CHUNK_SIZE (4 * 1000 * 1000)
#define MAX_CACHE_SIZE (8 * 1000 * 1000)

static void* spng_hunk_malloc(const size_t size)
{
    return ri.Malloc(size);
}
static void spng_hunk_free(void* ptr)
{
    // The library frequently calls this with a NULL pointer so we need to guard against freeing a NULL
    if (NULL != ptr) {
        ri.Free(ptr);
    }
}

static void* spng_hunk_realloc(UNUSED_VAR void* ptr, UNUSED_VAR size_t size)
{
    // This does not seem to be actually invoked during PNG read operations.
    // This is used during writes and if we were to use this for writes then we would need to implement.
    ri.Printf(PRINT_WARNING, "spng_hunk_realloc: Function invoked but usage pattern is unexpected and unimplemented.\n");
    return NULL;
}

static void* spng_hunk_calloc(size_t count, size_t size)
{
    size_t actualSize = count * size;
    void* pPtr = spng_hunk_malloc(actualSize);
    memset(pPtr, 0, actualSize);
    return pPtr;
}

static void* spng_temp_hunk_malloc(const size_t size)
{
    return ri.Hunk_AllocateTempMemory(size);
}
static void spng_temp_hunk_free(void* ptr)
{
    // The library frequently calls this with a NULL pointer so we need to guard against freeing a NULL
    if (NULL != ptr) {
        ri.Hunk_FreeTempMemory(ptr);
    }
}

static void* spng_temp_hunk_realloc(UNUSED_VAR void* ptr, UNUSED_VAR size_t size)
{
    // TODO: This will need to be implemented if we start to use temp_hunk space during writes
    //       however this would require that the hunk system be reworked so that we could always
    //       grow the "temp" hunk. Then we would need to expose this functionality.
    return NULL;
}

static void* spng_temp_hunk_calloc(size_t count, size_t size)
{
    size_t actualSize = count * size;
    void* pPtr = spng_temp_hunk_malloc(actualSize);
    memset(pPtr, 0, actualSize);
    return pPtr;
}

// The alloc structure that is used to allocate/release memory by PNG that is expected to persist over time
// (i.e. This is used by the read functions as the pixel data will persist for the duration of a scene)
static struct spng_alloc hunk_alloc = { .malloc_fn = spng_hunk_malloc, .realloc_fn = spng_hunk_realloc, .calloc_fn = spng_hunk_calloc, .free_fn = spng_hunk_free };

// The alloc structure that is used to allocate/release temporary memory by PNG where the allocation does
// not escape a boundary function. (i.e. This is used by the write functions as the pixel data will not
// persist after the image has been written)
UNUSED_VAR static struct spng_alloc temp_hunk_alloc = { .malloc_fn = spng_temp_hunk_malloc, .realloc_fn = spng_temp_hunk_realloc, .calloc_fn = spng_temp_hunk_calloc, .free_fn = spng_temp_hunk_free };

static void r_spng_load_error(const char* name, const int result, const char* functionName)
{
    ri.Printf(PRINT_WARNING, "R_LoadPNG: Failed to load png file named %s due to %s error calling %s.\n", name, spng_strerror(result), functionName);
}

void R_LoadPNG(const char* name, byte** pImage, int* pWidth, int* pHeight)
{
    spng_ctx* ctx = NULL;
    struct spng_ihdr ihdr;
    void* image = NULL;
    size_t size;
    void* pAssetData = NULL;
    long pAssetSize;
    int result;
    char localName[MAX_QPATH];

    assert(NULL != name);
    assert(NULL != pImage);
    assert(NULL != pWidth);
    assert(NULL != pHeight);

    *pImage = NULL;
    *pWidth = 0;
    *pHeight = 0;

    Q_strncpyz(localName, name, MAX_QPATH);

    const char* ext = COM_GetExtension(localName);

    // The MD3 files have embedded references to .tga textures which have
    // all been converted to .png files. So we have to identify a request
    // for a file with a .tga and treat it as a .png file. It is an ugly hack
    // but is required until we convert the md3 files into a different format
    if (!Q_stricmpn(ext, ".tga", MAX_QPATH)) {
        COM_StripExtension(name, localName, MAX_QPATH);
        Q_strcat(localName, MAX_QPATH, ".png");
    }

    pAssetSize = ri.FS_ReadFile((char*)localName, &pAssetData);
    if (NULL == pAssetData || -1 == pAssetSize) {
        goto cleanup;
    } else {
        ctx = spng_ctx_new2(&hunk_alloc, 0);
        if (NULL == ctx) {
            r_spng_load_error(localName, SPNG_EMEM, "spng_ctx_new2");
            return;
        } else if (SPNG_OK != (result = spng_set_image_limits(ctx, MAX_READ_PNG_WIDTH, MAX_READ_PNG_HEIGHT))) {
            r_spng_load_error(localName, result, "spng_set_image_limits");
            goto cleanup;
        } else if (SPNG_OK != (result = spng_set_chunk_limits(ctx, MAX_CHUNK_SIZE, MAX_CACHE_SIZE))) {
            r_spng_load_error(localName, result, "spng_set_chunk_limits");
            goto cleanup;
        } else if (SPNG_OK != (result = spng_set_png_buffer(ctx, pAssetData, pAssetSize))) {
            r_spng_load_error(localName, result, "spng_set_png_buffer");
            goto cleanup;
        } else if (SPNG_OK != (result = spng_get_ihdr(ctx, &ihdr))) {
            r_spng_load_error(localName, result, "spng_get_ihdr");
            goto cleanup;
        } else if (SPNG_OK != spng_decoded_image_size(ctx, SPNG_FMT_RGBA8, &size)) {
            r_spng_load_error(localName, result, "spng_decoded_image_size");
            goto cleanup;
        } else {
            image = ri.Malloc(size);
            if (NULL == image) {
                r_spng_load_error(localName, result, "ri.Malloc");
                goto cleanup;
            } else if (SPNG_OK != spng_decode_image(ctx, image, size, SPNG_FMT_RGBA8, SPNG_DECODE_TRNS | SPNG_DECODE_GAMMA)) {
                r_spng_load_error(localName, result, "spng_decode_image");
                goto cleanup;
            } else {
                *pWidth = ihdr.width;
                *pHeight = ihdr.height;
                *pImage = image;
                // Clear image so it does not deallocated in cleanup phase
                image = NULL;
            }
        }
    }
cleanup:
    if (NULL != image) {
        hunk_alloc.free_fn(image);
    }
    if (NULL != pAssetData) {
        ri.FS_FreeFile(pAssetData);
    }
    if (NULL != ctx) {
        spng_ctx_free(ctx);
    }
}

static void r_spng_save_error(const char* name, const int result, const char* functionName)
{
    ri.Printf(PRINT_WARNING, "RE_SavePNG: Failed to save screenshot to png file named %s due to %s error calling %s.\n", name, spng_strerror(result), functionName);
}

/*
 * Save the specified image data in PNG format to specified filename.
 * Input data is in RGB form with a possible padding at the end of each row.
 */
void RE_SavePNG(const char* filename, const uint32_t image_width, const uint32_t image_height, const byte* image_buffer, const int padding)
{
    // Set image properties, this determines the destination image format
    struct spng_ihdr ihdr = {
        .width = image_width,
        .height = image_height,
        .color_type = SPNG_COLOR_TYPE_TRUECOLOR,
        .bit_depth = 8,
        .compression_method = 0,
        .filter_method = SPNG_FILTER_NONE,
        .interlace_method = SPNG_INTERLACE_NONE
    };
    void* image = NULL;
    int result;

    // TODO: In the future we should use the temp hunk rather than the operating system allocator but until
    //  we get around to rewriting the temp hunk allocator we will not be able to use the following line.
    //  spng_ctx* ctx = spng_ctx_new2(&temp_hunk_alloc, SPNG_CTX_ENCODER);
    spng_ctx* ctx = spng_ctx_new(SPNG_CTX_ENCODER);
    if (NULL == ctx) {
        r_spng_load_error(filename, SPNG_EMEM, "spng_ctx_new2");
        return;
    } else if (SPNG_OK != (result = spng_set_image_limits(ctx, MAX_WRITE_PNG_WIDTH, MAX_WRITE_PNG_HEIGHT))) {
        r_spng_load_error(filename, result, "spng_set_image_limits");
        goto cleanup;
    } else if (SPNG_OK != (result = spng_set_chunk_limits(ctx, MAX_CHUNK_SIZE, MAX_CACHE_SIZE))) {
        r_spng_load_error(filename, result, "spng_set_chunk_limits");
        goto cleanup;
    } else if (SPNG_OK != (result = spng_set_option(ctx, SPNG_ENCODE_TO_BUFFER, 1))) {
        r_spng_save_error(filename, result, "spng_set_option");
        goto cleanup;
    } else if (SPNG_OK != (result = spng_set_ihdr(ctx, &ihdr))) {
        r_spng_save_error(filename, result, "spng_set_ihdr");
        goto cleanup;
    } else if (SPNG_OK != (result = spng_encode_chunks(ctx))) {
        r_spng_save_error(filename, result, "spng_encode_chunks");
        goto cleanup;
    } else if (SPNG_OK != (result = spng_encode_image(ctx, NULL, 0, SPNG_FMT_PNG, SPNG_ENCODE_PROGRESSIVE | SPNG_ENCODE_FINALIZE))) {
        r_spng_save_error(filename, result, "spng_encode_image");
        goto cleanup;
    } else {
        // PNG is encoded from top to bottom while the pixel data is supplied in the other order,
        // so we save a row at a time in reverse order.
        const size_t row_size = image_width * 3;
        const size_t padded_row_size = row_size + padding;
        for (int i = (int)image_height - 1; i >= 0; i--) {
            const void* row = image_buffer + (padded_row_size * i);
            result = spng_encode_row(ctx, row, row_size);
            if (0 == i) {
                // The SPNG_EOI (end-of-image) return code is expected when you supply the
                // last row of data, otherwise an error has occurred
                if (SPNG_EOI != result) {
                    r_spng_save_error(filename, result, "last spng_encode_row");
                    goto cleanup;
                }
            } else if (SPNG_OK != result) {
                r_spng_save_error(filename, result, "spng_encode_row");
                goto cleanup;
            }
        }

        size_t png_size;

        // Get the internal buffer of the finished PNG
        image = spng_get_png_buffer(ctx, &png_size, &result);
        if (NULL == image) {
            r_spng_save_error(filename, result, "spng_get_png_buffer");
            goto cleanup;
        } else {
            ri.FS_WriteFile(filename, image, png_size);
        }
    }
cleanup:
    if (NULL != image) {
        // TODO: See note above regarding use of temp hunk allocator. When this occurs we should uncomment the next line:
        // hunk_alloc.free_fn(image);
        free(image);
    }
    spng_ctx_free(ctx);
}
