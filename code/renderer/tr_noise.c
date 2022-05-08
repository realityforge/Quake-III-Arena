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
#include "tr_common.h"

#define NOISE_SIZE 256
#define NOISE_MASK (NOISE_SIZE - 1)

#define VAL(a) s_noise_perm[(a) & (NOISE_MASK)]
#define INDEX(x, y, z, t) VAL((x) + VAL((y) + VAL((z) + VAL(t))))

static float s_noise_table[NOISE_SIZE];
static int s_noise_perm[NOISE_SIZE];

static float GetNoiseValue(int x, int y, int z, int t)
{
    return s_noise_table[INDEX(x, y, z, t)];
}

void R_NoiseInit(void)
{
    for (int i = 0; i < NOISE_SIZE; i++) {
        s_noise_table[i] = (float)((((float)(rand()) / (float)RAND_MAX) * 2.0F - 1.0F));
        s_noise_perm[i] = (unsigned char)((float)(rand()) / (float)RAND_MAX * 255.0F);
    }
}

float R_NoiseGet4f(float x, float y, float z, double t)
{
    const float ixf = floorf(x);
    const int ix = (int)ixf;
    const float fx = x - (float)ix;
    const float iyf = floorf(y);
    const int iy = (int)iyf;
    const float fy = y - (float)iy;
    const float izf = floorf(z);
    const int iz = (int)izf;
    const float fz = z - (float)iz;
    const double itd = floor(t);
    const int it = (int)itd;
    const float ft = (float)(t - (double)it);

    float value[2];
    for (int i = 0; i < 2; i++) {
        float front[4];
        float back[4];

        front[0] = GetNoiseValue(ix, iy, iz, it + i);
        front[1] = GetNoiseValue(ix + 1, iy, iz, it + i);
        front[2] = GetNoiseValue(ix, iy + 1, iz, it + i);
        front[3] = GetNoiseValue(ix + 1, iy + 1, iz, it + i);

        back[0] = GetNoiseValue(ix, iy, iz + 1, it + i);
        back[1] = GetNoiseValue(ix + 1, iy, iz + 1, it + i);
        back[2] = GetNoiseValue(ix, iy + 1, iz + 1, it + i);
        back[3] = GetNoiseValue(ix + 1, iy + 1, iz + 1, it + i);

        const float fvalue = LERP(LERP(front[0], front[1], fx), LERP(front[2], front[3], fx), fy);
        const float bvalue = LERP(LERP(back[0], back[1], fx), LERP(back[2], back[3], fx), fy);

        value[i] = LERP(fvalue, bvalue, fz);
    }
    return LERP(value[0], value[1], ft);
}
