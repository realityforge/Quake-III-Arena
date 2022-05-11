/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

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

#include <setjmp.h>

#include "../qcommon/attributes.h"
#include "tr_common.h"

/*
 * Include file for users of JPEG library.
 * You will need to have included system headers that define at least
 * the typedefs FILE and size_t before you can include jpeglib.h.
 * (stdio.h is sufficient on ANSI-conforming systems.)
 * You may also wish to include "jerror.h".
 */

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpadded"
#include "jpeglib.h"
#pragma clang diagnostic push

/* Catching errors, as done in libjpeg's example.c */
typedef struct q_jpeg_error_mgr_s {
    struct jpeg_error_mgr pub; /* "public" fields */

    jmp_buf setjmp_buffer; /* for return to caller */
} q_jpeg_error_mgr_t;

static NORETURN void R_JPGErrorExit(j_common_ptr cinfo)
{
    char buffer[JMSG_LENGTH_MAX];

    /* cinfo->err really points to a q_jpeg_error_mgr_s struct, so coerce pointer */
    q_jpeg_error_mgr_t* jerr = (q_jpeg_error_mgr_t*)cinfo->err;

    (*cinfo->err->format_message)(cinfo, buffer);

    ri.Printf(PRINT_ALL, "Error: %s", buffer);

    /* Return control to the setjmp point */
    longjmp(jerr->setjmp_buffer, 1);
}

static void R_JPGOutputMessage(j_common_ptr cinfo)
{
    char buffer[JMSG_LENGTH_MAX];

    /* Create the message */
    (*cinfo->err->format_message)(cinfo, buffer);

    /* Send it to stderr, adding a newline */
    ri.Printf(PRINT_ALL, "%s\n", buffer);
}

/* Expanded data destination object for stdio output */

typedef struct {
    struct jpeg_destination_mgr pub; /* public fields */

    byte* outfile; /* target stream */
    size_t size;
} my_destination_mgr;

typedef my_destination_mgr* my_dest_ptr;

/*
 * Initialize destination --- called by jpeg_start_compress
 * before any data is actually written.
 */

static void
init_destination(j_compress_ptr cinfo)
{
    my_dest_ptr dest = (my_dest_ptr)cinfo->dest;

    dest->pub.next_output_byte = dest->outfile;
    dest->pub.free_in_buffer = dest->size;
}

/*
 * Empty the output buffer --- called whenever buffer fills up.
 *
 * In typical applications, this should write the entire output buffer
 * (ignoring the current state of next_output_byte & free_in_buffer),
 * reset the pointer & count to the start of the buffer, and return TRUE
 * indicating that the buffer has been dumped.
 *
 * In applications that need to be able to suspend compression due to output
 * overrun, a FALSE return indicates that the buffer cannot be emptied now.
 * In this situation, the compressor will return to its caller (possibly with
 * an indication that it has not accepted all the supplied scanlines).  The
 * application should resume compression after it has made more room in the
 * output buffer.  Note that there are substantial restrictions on the use of
 * suspension --- see the documentation.
 *
 * When suspending, the compressor will back up to a convenient restart point
 * (typically the start of the current MCU). next_output_byte & free_in_buffer
 * indicate where the restart point will be if the current call returns FALSE.
 * Data beyond this point will be regenerated after resumption, so do not
 * write it out when emptying the buffer externally.
 */

static boolean
empty_output_buffer(j_compress_ptr cinfo)
{
    my_dest_ptr dest = (my_dest_ptr)cinfo->dest;

    jpeg_destroy_compress(cinfo);

    // Make crash fatal or we would probably leak memory.
    ri.Error(ERR_FATAL, "Output buffer for encoded JPEG image has insufficient size of %zu bytes", dest->size);

    return FALSE;
}

/*
 * Terminate destination --- called by jpeg_finish_compress
 * after all data has been written.  Usually needs to flush buffer.
 *
 * NB: *not* called by jpeg_abort or jpeg_destroy; surrounding
 * application must deal with any cleanup that should happen even
 * for error exit.
 */

static void term_destination(UNUSED_VAR j_compress_ptr cinfo)
{
}

/*
 * Prepare for output to a stdio stream.
 * The caller must have already opened the stream, and is responsible
 * for closing it after finishing compression.
 */

static void jpegDest(j_compress_ptr cinfo, byte* outfile, size_t size)
{
    my_dest_ptr dest;

    /* The destination object is made permanent so that multiple JPEG images
     * can be written to the same file without re-executing jpeg_stdio_dest.
     * This makes it dangerous to use this manager and a different destination
     * manager serially with the same JPEG object, because their private object
     * sizes may be different.  Caveat programmer.
     */
    if (cinfo->dest == NULL) { /* first time for this JPEG object? */
        cinfo->dest = (struct jpeg_destination_mgr*)(*cinfo->mem->alloc_small)((j_common_ptr)cinfo, JPOOL_PERMANENT,
                                                                               sizeof(my_destination_mgr));
    }

    dest = (my_dest_ptr)cinfo->dest;
    dest->pub.init_destination = init_destination;
    dest->pub.empty_output_buffer = empty_output_buffer;
    dest->pub.term_destination = term_destination;
    dest->outfile = outfile;
    dest->size = size;
}

/*
=================
SaveJPGToBuffer

Encodes JPEG from image in image_buffer and writes to buffer.
Expects RGB input data
=================
*/
size_t RE_SaveJPGToBuffer(byte* buffer, size_t bufSize, int quality, const uint32_t image_width, const uint32_t image_height, byte* image_buffer, uint16_t padding)
{
    struct jpeg_compress_struct cinfo;
    q_jpeg_error_mgr_t jerr;
    JSAMPROW row_pointer[1]; /* pointer to JSAMPLE row[s] */
    my_dest_ptr dest;
    size_t row_stride; /* physical row width in image buffer */
    size_t outcount;

    /* Step 1: allocate and initialize JPEG compression object */
    cinfo.err = jpeg_std_error(&jerr.pub);
    cinfo.err->error_exit = R_JPGErrorExit;
    cinfo.err->output_message = R_JPGOutputMessage;

    /* Establish the setjmp return context for R_JPGErrorExit to use. */
    if (setjmp(jerr.setjmp_buffer)) {
        /* If we get here, the JPEG code has signaled an error.
         * We need to clean up the JPEG object and return.
         */
        jpeg_destroy_compress(&cinfo);

        ri.Printf(PRINT_ALL, "\n");
        return 0;
    }

    /* Now we can initialize the JPEG compression object. */
    jpeg_create_compress(&cinfo);

    /* Step 2: specify data destination (eg, a file) */
    /* Note: steps 2 and 3 can be done in either order. */
    jpegDest(&cinfo, buffer, bufSize);

    /* Step 3: set parameters for compression */
    cinfo.image_width = image_width; /* image width and height, in pixels */
    cinfo.image_height = image_height;
    cinfo.input_components = 3; /* # of color components per pixel */
    cinfo.in_color_space = JCS_RGB; /* colorspace of input image */

    jpeg_set_defaults(&cinfo);
    jpeg_set_quality(&cinfo, quality, TRUE /* limit to baseline-JPEG values */);
    /* If quality is set high, disable chroma subsampling */
    if (quality >= 85) {
        cinfo.comp_info[0].h_samp_factor = 1;
        cinfo.comp_info[0].v_samp_factor = 1;
    }

    /* Step 4: Start compressor */
    jpeg_start_compress(&cinfo, TRUE);

    /* Step 5: while (scan lines remain to be written) */
    /*           jpeg_write_scanlines(...); */
    row_stride = image_width * (unsigned int)cinfo.input_components + padding; /* JSAMPLEs per row in image_buffer */

    while (cinfo.next_scanline < cinfo.image_height) {
        /* jpeg_write_scanlines expects an array of pointers to scanlines.
         * Here the array is only one element long, but you could pass
         * more than one scanline at a time if that's more convenient.
         */
        row_pointer[0] = &image_buffer[((cinfo.image_height - 1) * row_stride) - cinfo.next_scanline * row_stride];
        (void)jpeg_write_scanlines(&cinfo, row_pointer, 1);
    }

    /* Step 6: Finish compression */
    jpeg_finish_compress(&cinfo);

    dest = (my_dest_ptr)cinfo.dest;
    outcount = dest->size - dest->pub.free_in_buffer;

    /* Step 7: release JPEG compression object */
    jpeg_destroy_compress(&cinfo);

    /* And we're done! */
    return outcount;
}

void RE_SaveJPG(const char* filename, int quality, const uint32_t image_width, const uint32_t image_height, byte* image_buffer, const uint16_t padding)
{
    byte* out;
    size_t bufSize;

    bufSize = image_width * image_height * 3;
    out = ri.Hunk_AllocateTempMemory(bufSize);

    bufSize = RE_SaveJPGToBuffer(out, bufSize, quality, image_width, image_height, image_buffer, padding);
    ri.FS_WriteFile(filename, out, bufSize);

    ri.Hunk_FreeTempMemory(out);
}
