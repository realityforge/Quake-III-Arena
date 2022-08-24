/*
===========================================================================
Copyright (C) 2011 Andrei Drexler, Richard Allen, James Canete

This file is part of Reaction source code.

Reaction source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Reaction source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Reaction source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/

#include "tr_local.h"

void RB_ToneMap(FBO_t* hdrFbo, ivec4_t hdrBox, FBO_t* ldrFbo, ivec4_t ldrBox, int autoExposure)
{
    ivec4_t srcBox, dstBox;
    vec4_t color;
    static int lastFrameCount = 0;

    if (autoExposure) {
        if (lastFrameCount == 0 || tr.frameCount < lastFrameCount || tr.frameCount - lastFrameCount > 5) {
            // determine average log luminance
            FBO_t *srcFbo, *dstFbo, *tmp;
            int size = 256;

            lastFrameCount = tr.frameCount;

            VectorSet4(dstBox, 0, 0, size, size);

            FBO_Blit(hdrFbo, hdrBox, NULL, tr.textureScratchFbo[0], dstBox, &tr.calclevels4xShader[0], NULL, 0);

            srcFbo = tr.textureScratchFbo[0];
            dstFbo = tr.textureScratchFbo[1];

            // downscale to 1x1 texture
            while (size > 1) {
                VectorSet4(srcBox, 0, 0, size, size);
                // size >>= 2;
                size >>= 1;
                VectorSet4(dstBox, 0, 0, size, size);

                if (size == 1)
                    dstFbo = tr.targetLevelsFbo;

                // FBO_Blit(targetFbo, srcBox, NULL, tr.textureScratchFbo[nextScratch], dstBox, &tr.calclevels4xShader[1], NULL, 0);
                FBO_FastBlit(srcFbo, srcBox, dstFbo, dstBox, GL_COLOR_BUFFER_BIT, GL_LINEAR);

                tmp = srcFbo;
                srcFbo = dstFbo;
                dstFbo = tmp;
            }
        }

        // blend with old log luminance for gradual change
        VectorSet4(srcBox, 0, 0, 0, 0);

        color[0] = color[1] = color[2] = 1.0f;
        if (glConfig.textureFloat)
            color[3] = 0.03f;
        else
            color[3] = 0.1f;

        FBO_Blit(tr.targetLevelsFbo, srcBox, NULL, tr.calcLevelsFbo, NULL, NULL, color, GLS_SRCBLEND_SRC_ALPHA | GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA);
    }

    // tonemap
    color[0] = color[1] = color[2] = pow(2, r_cameraExposure->value - autoExposure); // exp2(r_cameraExposure->value);
    color[3] = 1.0f;

    if (autoExposure)
        GL_BindToTMU(tr.calcLevelsImage, TB_LEVELSMAP);
    else
        GL_BindToTMU(tr.fixedLevelsImage, TB_LEVELSMAP);

    FBO_Blit(hdrFbo, hdrBox, NULL, ldrFbo, ldrBox, &tr.tonemapShader, color, 0);
}
