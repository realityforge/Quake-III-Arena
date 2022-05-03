/*
Copyright 2022 Peter Donald

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

#include "tr_common.h"
#include <spng.h>

// Some guesses at reasonable PNG limits. As we are potentially decoding untrusted files, we should
// protect against failures due to excessive memory consumption. If a PNG exceeds these limits then it
// will simply fail to be loaded. Each image will take at most (MAX_READ_PNG_WIDTH x MAX_READ_PNG_HEIGHT
#define MAX_READ_PNG_WIDTH 2048
#define MAX_READ_PNG_HEIGHT 2048

// Set memory usage limits for storing standard and unknown chunks, this is important when reading untrusted files!
// No real thought has gone into what these should be set to so taking some (reasonable?) values from the upstream
// library's documentation/examples.
#define MAX_CHUNK_SIZE (4 * 1000 * 1000)
#define MAX_CACHE_SIZE (8 * 1000 * 1000)

static void* r_spng_malloc(const size_t size)
{
    return ri.Malloc(size);
}
static void r_spng_free(void* ptr)
{
    // The library frequently calls this with a NULL pointer so we need to guard against freeing a NULL
    if (NULL != ptr) {
        ri.Free(ptr);
    }
}

static void* r_spng_realloc(void* ptr, size_t size)
{
    // This does not seem to be actually invoked but it is implemented for completeness ... in a very inefficient way
    // Generate a warning for a developer to notify a developer so that it can be reimplemented more efficiently
    ri.Printf(PRINT_DEVELOPER, "r_spng_realloc: Function invoked but usage pattern is unexpected and un-optimised.\n");
    r_spng_free(ptr);
    return r_spng_malloc(size);
}

static void* r_spng_calloc(size_t count, size_t size)
{
    size_t actualSize = count * size;
    void* pPtr = r_spng_malloc(actualSize);
    memset(pPtr, 0, actualSize);
    return pPtr;
}

// The alloc structure that is used to allocate/release memory by PNG that is expected to persist over time
// (i.e. This is used by the read functions as the pixel data will persist for the duration of a scene)
static struct spng_alloc long_term_spng_alloc = { .malloc_fn = r_spng_malloc, .realloc_fn = r_spng_realloc, .calloc_fn = r_spng_calloc, .free_fn = r_spng_free };

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
        ctx = spng_ctx_new2(&long_term_spng_alloc, 0);
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
        free(image);
    }
    if (NULL != ctx) {
        spng_ctx_free(ctx);
    }
}
