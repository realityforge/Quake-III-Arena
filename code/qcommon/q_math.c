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
// q_math.c -- stateless support routines that are included in each code module
#include "q_shared.h"

vec3_t vec3_origin = { 0, 0, 0 };
vec3_t axisDefault[3] = { { 1, 0, 0 }, { 0, 1, 0 }, { 0, 0, 1 } };

vec4_t colorBlack = { 0, 0, 0, 1 };
vec4_t colorRed = { 1, 0, 0, 1 };
vec4_t colorGreen = { 0, 1, 0, 1 };
vec4_t colorYellow = { 1, 1, 0, 1 };
vec4_t colorWhite = { 1, 1, 1, 1 };
vec4_t colorMdGrey = { 0.5, 0.5, 0.5, 1 };

vec4_t g_color_table[8] = {
    { 0.0, 0.0, 0.0, 1.0 },
    { 1.0, 0.0, 0.0, 1.0 },
    { 0.0, 1.0, 0.0, 1.0 },
    { 1.0, 1.0, 0.0, 1.0 },
    { 0.0, 0.0, 1.0, 1.0 },
    { 0.0, 1.0, 1.0, 1.0 },
    { 1.0, 0.0, 1.0, 1.0 },
    { 1.0, 1.0, 1.0, 1.0 },
};

vec3_t bytedirs[NUMVERTEXNORMALS] = {
    { -0.525731f, 0.000000f, 0.850651f }, { -0.442863f, 0.238856f, 0.864188f }, { -0.295242f, 0.000000f, 0.955423f }, { -0.309017f, 0.500000f, 0.809017f }, { -0.162460f, 0.262866f, 0.951056f }, { 0.000000f, 0.000000f, 1.000000f }, { 0.000000f, 0.850651f, 0.525731f }, { -0.147621f, 0.716567f, 0.681718f }, { 0.147621f, 0.716567f, 0.681718f }, { 0.000000f, 0.525731f, 0.850651f }, { 0.309017f, 0.500000f, 0.809017f }, { 0.525731f, 0.000000f, 0.850651f }, { 0.295242f, 0.000000f, 0.955423f }, { 0.442863f, 0.238856f, 0.864188f }, { 0.162460f, 0.262866f, 0.951056f }, { -0.681718f, 0.147621f, 0.716567f }, { -0.809017f, 0.309017f, 0.500000f }, { -0.587785f, 0.425325f, 0.688191f }, { -0.850651f, 0.525731f, 0.000000f }, { -0.864188f, 0.442863f, 0.238856f }, { -0.716567f, 0.681718f, 0.147621f }, { -0.688191f, 0.587785f, 0.425325f }, { -0.500000f, 0.809017f, 0.309017f }, { -0.238856f, 0.864188f, 0.442863f }, { -0.425325f, 0.688191f, 0.587785f }, { -0.716567f, 0.681718f, -0.147621f }, { -0.500000f, 0.809017f, -0.309017f }, { -0.525731f, 0.850651f, 0.000000f }, { 0.000000f, 0.850651f, -0.525731f }, { -0.238856f, 0.864188f, -0.442863f }, { 0.000000f, 0.955423f, -0.295242f }, { -0.262866f, 0.951056f, -0.162460f }, { 0.000000f, 1.000000f, 0.000000f }, { 0.000000f, 0.955423f, 0.295242f }, { -0.262866f, 0.951056f, 0.162460f }, { 0.238856f, 0.864188f, 0.442863f }, { 0.262866f, 0.951056f, 0.162460f }, { 0.500000f, 0.809017f, 0.309017f }, { 0.238856f, 0.864188f, -0.442863f }, { 0.262866f, 0.951056f, -0.162460f }, { 0.500000f, 0.809017f, -0.309017f }, { 0.850651f, 0.525731f, 0.000000f }, { 0.716567f, 0.681718f, 0.147621f }, { 0.716567f, 0.681718f, -0.147621f }, { 0.525731f, 0.850651f, 0.000000f }, { 0.425325f, 0.688191f, 0.587785f }, { 0.864188f, 0.442863f, 0.238856f }, { 0.688191f, 0.587785f, 0.425325f }, { 0.809017f, 0.309017f, 0.500000f }, { 0.681718f, 0.147621f, 0.716567f }, { 0.587785f, 0.425325f, 0.688191f }, { 0.955423f, 0.295242f, 0.000000f }, { 1.000000f, 0.000000f, 0.000000f }, { 0.951056f, 0.162460f, 0.262866f }, { 0.850651f, -0.525731f, 0.000000f }, { 0.955423f, -0.295242f, 0.000000f }, { 0.864188f, -0.442863f, 0.238856f }, { 0.951056f, -0.162460f, 0.262866f }, { 0.809017f, -0.309017f, 0.500000f }, { 0.681718f, -0.147621f, 0.716567f }, { 0.850651f, 0.000000f, 0.525731f }, { 0.864188f, 0.442863f, -0.238856f }, { 0.809017f, 0.309017f, -0.500000f }, { 0.951056f, 0.162460f, -0.262866f }, { 0.525731f, 0.000000f, -0.850651f }, { 0.681718f, 0.147621f, -0.716567f }, { 0.681718f, -0.147621f, -0.716567f }, { 0.850651f, 0.000000f, -0.525731f }, { 0.809017f, -0.309017f, -0.500000f }, { 0.864188f, -0.442863f, -0.238856f }, { 0.951056f, -0.162460f, -0.262866f }, { 0.147621f, 0.716567f, -0.681718f }, { 0.309017f, 0.500000f, -0.809017f }, { 0.425325f, 0.688191f, -0.587785f }, { 0.442863f, 0.238856f, -0.864188f }, { 0.587785f, 0.425325f, -0.688191f }, { 0.688191f, 0.587785f, -0.425325f }, { -0.147621f, 0.716567f, -0.681718f }, { -0.309017f, 0.500000f, -0.809017f }, { 0.000000f, 0.525731f, -0.850651f }, { -0.525731f, 0.000000f, -0.850651f }, { -0.442863f, 0.238856f, -0.864188f }, { -0.295242f, 0.000000f, -0.955423f }, { -0.162460f, 0.262866f, -0.951056f }, { 0.000000f, 0.000000f, -1.000000f }, { 0.295242f, 0.000000f, -0.955423f }, { 0.162460f, 0.262866f, -0.951056f }, { -0.442863f, -0.238856f, -0.864188f }, { -0.309017f, -0.500000f, -0.809017f }, { -0.162460f, -0.262866f, -0.951056f }, { 0.000000f, -0.850651f, -0.525731f }, { -0.147621f, -0.716567f, -0.681718f }, { 0.147621f, -0.716567f, -0.681718f }, { 0.000000f, -0.525731f, -0.850651f }, { 0.309017f, -0.500000f, -0.809017f }, { 0.442863f, -0.238856f, -0.864188f }, { 0.162460f, -0.262866f, -0.951056f }, { 0.238856f, -0.864188f, -0.442863f }, { 0.500000f, -0.809017f, -0.309017f }, { 0.425325f, -0.688191f, -0.587785f }, { 0.716567f, -0.681718f, -0.147621f }, { 0.688191f, -0.587785f, -0.425325f }, { 0.587785f, -0.425325f, -0.688191f }, { 0.000000f, -0.955423f, -0.295242f }, { 0.000000f, -1.000000f, 0.000000f }, { 0.262866f, -0.951056f, -0.162460f }, { 0.000000f, -0.850651f, 0.525731f }, { 0.000000f, -0.955423f, 0.295242f }, { 0.238856f, -0.864188f, 0.442863f }, { 0.262866f, -0.951056f, 0.162460f }, { 0.500000f, -0.809017f, 0.309017f }, { 0.716567f, -0.681718f, 0.147621f }, { 0.525731f, -0.850651f, 0.000000f }, { -0.238856f, -0.864188f, -0.442863f }, { -0.500000f, -0.809017f, -0.309017f }, { -0.262866f, -0.951056f, -0.162460f }, { -0.850651f, -0.525731f, 0.000000f }, { -0.716567f, -0.681718f, -0.147621f }, { -0.716567f, -0.681718f, 0.147621f }, { -0.525731f, -0.850651f, 0.000000f }, { -0.500000f, -0.809017f, 0.309017f }, { -0.238856f, -0.864188f, 0.442863f }, { -0.262866f, -0.951056f, 0.162460f }, { -0.864188f, -0.442863f, 0.238856f }, { -0.809017f, -0.309017f, 0.500000f }, { -0.688191f, -0.587785f, 0.425325f }, { -0.681718f, -0.147621f, 0.716567f }, { -0.442863f, -0.238856f, 0.864188f }, { -0.587785f, -0.425325f, 0.688191f }, { -0.309017f, -0.500000f, 0.809017f }, { -0.147621f, -0.716567f, 0.681718f }, { -0.425325f, -0.688191f, 0.587785f }, { -0.162460f, -0.262866f, 0.951056f }, { 0.442863f, -0.238856f, 0.864188f }, { 0.162460f, -0.262866f, 0.951056f }, { 0.309017f, -0.500000f, 0.809017f }, { 0.147621f, -0.716567f, 0.681718f }, { 0.000000f, -0.525731f, 0.850651f }, { 0.425325f, -0.688191f, 0.587785f }, { 0.587785f, -0.425325f, 0.688191f }, { 0.688191f, -0.587785f, 0.425325f }, { -0.955423f, 0.295242f, 0.000000f }, { -0.951056f, 0.162460f, 0.262866f }, { -1.000000f, 0.000000f, 0.000000f }, { -0.850651f, 0.000000f, 0.525731f }, { -0.955423f, -0.295242f, 0.000000f }, { -0.951056f, -0.162460f, 0.262866f }, { -0.864188f, 0.442863f, -0.238856f }, { -0.951056f, 0.162460f, -0.262866f }, { -0.809017f, 0.309017f, -0.500000f }, { -0.864188f, -0.442863f, -0.238856f }, { -0.951056f, -0.162460f, -0.262866f }, { -0.809017f, -0.309017f, -0.500000f }, { -0.681718f, 0.147621f, -0.716567f }, { -0.681718f, -0.147621f, -0.716567f }, { -0.850651f, 0.000000f, -0.525731f }, { -0.688191f, 0.587785f, -0.425325f }, { -0.587785f, 0.425325f, -0.688191f }, { -0.425325f, 0.688191f, -0.587785f }, { -0.425325f, -0.688191f, -0.587785f }, { -0.587785f, -0.425325f, -0.688191f }, { -0.688191f, -0.587785f, -0.425325f }
};

int Q_rand(int* seed)
{
    *seed = (69069 * *seed + 1);
    return *seed;
}

float Q_random(int* seed)
{
    return (float)(Q_rand(seed) & 0xffff) / (float)0x10000;
}

float Q_crandom(int* seed)
{
    return 2.0F * (Q_random(seed) - 0.5F);
}

#ifdef __LCC__

int VectorCompare(const vec3_t v1, const vec3_t v2)
{
    if (v1[0] != v2[0] || v1[1] != v2[1] || v1[2] != v2[2]) {
        return 0;
    }
    return 1;
}

vec_t VectorLength(const vec3_t v)
{
    return (vec_t)sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
}

vec_t VectorLengthSquared(const vec3_t v)
{
    return (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
}

vec_t Distance(const vec3_t p1, const vec3_t p2)
{
    vec3_t v;

    VectorSubtract(p2, p1, v);
    return VectorLength(v);
}

vec_t DistanceSquared(const vec3_t p1, const vec3_t p2)
{
    vec3_t v;

    VectorSubtract(p2, p1, v);
    return v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
}

// fast vector normalize routine that does not check to make sure
// that length != 0, nor does it return length, uses rsqrt approximation
void VectorNormalizeFast(vec3_t v)
{
    float ilength;

    ilength = Q_rsqrt(DotProduct(v, v));

    v[0] *= ilength;
    v[1] *= ilength;
    v[2] *= ilength;
}

void VectorInverse(vec3_t v)
{
    v[0] = -v[0];
    v[1] = -v[1];
    v[2] = -v[2];
}

void CrossProduct(const vec3_t v1, const vec3_t v2, vec3_t cross)
{
    cross[0] = v1[1] * v2[2] - v1[2] * v2[1];
    cross[1] = v1[2] * v2[0] - v1[0] * v2[2];
    cross[2] = v1[0] * v2[1] - v1[1] * v2[0];
}
#endif

signed char ClampChar(const int i)
{
    if (i < -128) {
        return -128;
    } else if (i > 127) {
        return 127;
    } else {
        return (signed char)i;
    }
}

// this isn't a real cheap function to call!
int DirToByte(vec3_t dir)
{
    int i, best;
    float d, bestd;

    if (!dir) {
        return 0;
    }

    bestd = 0;
    best = 0;
    for (i = 0; i < NUMVERTEXNORMALS; i++) {
        d = DotProduct(dir, bytedirs[i]);
        if (d > bestd) {
            bestd = d;
            best = i;
        }
    }

    return best;
}

void ByteToDir(int b, vec3_t dir)
{
    if (b < 0 || b >= NUMVERTEXNORMALS) {
        VectorCopy(vec3_origin, dir);
        return;
    }
    VectorCopy(bytedirs[b], dir);
}

uint32_t ColorBytes4(const float r, const float g, const float b, const float a)
{
    uint8_t i;

    ((uint8_t*)&i)[0] = (uint8_t)(r * 255);
    ((uint8_t*)&i)[1] = (uint8_t)(g * 255);
    ((uint8_t*)&i)[2] = (uint8_t)(b * 255);
    ((uint8_t*)&i)[3] = (uint8_t)(a * 255);

    return i;
}

/*
=====================
PlaneFromPoints

Returns false if the triangle is degenerate.
The normal will point out of the clock for clockwise ordered points
=====================
*/
bool PlaneFromPoints(vec4_t plane, const vec3_t a, const vec3_t b, const vec3_t c)
{
    vec3_t d1, d2;

    VectorSubtract(b, a, d1);
    VectorSubtract(c, a, d2);
    CrossProduct(d2, d1, plane);
    if (VectorNormalize(plane) == 0) {
        return false;
    }

    plane[3] = DotProduct(a, plane);
    return true;
}

/*
===============
RotatePointAroundVector

This is not implemented very well...
===============
*/
void RotatePointAroundVector(vec3_t dst, const vec3_t dir, const vec3_t point,
                             float degrees)
{
    float m[3][3];
    float im[3][3];
    float zrot[3][3];
    float tmpmat[3][3];
    float rot[3][3];
    int i;
    vec3_t vr, vup, vf;
    float rad;

    vf[0] = dir[0];
    vf[1] = dir[1];
    vf[2] = dir[2];

    PerpendicularVector(vr, dir);
    CrossProduct(vr, vf, vup);

    m[0][0] = vr[0];
    m[1][0] = vr[1];
    m[2][0] = vr[2];

    m[0][1] = vup[0];
    m[1][1] = vup[1];
    m[2][1] = vup[2];

    m[0][2] = vf[0];
    m[1][2] = vf[1];
    m[2][2] = vf[2];

    memcpy(im, m, sizeof(im));

    im[0][1] = m[1][0];
    im[0][2] = m[2][0];
    im[1][0] = m[0][1];
    im[1][2] = m[2][1];
    im[2][0] = m[0][2];
    im[2][1] = m[1][2];

    memset(zrot, 0, sizeof(zrot));
    zrot[0][0] = zrot[1][1] = zrot[2][2] = 1.0F;

    rad = DEG2RAD(degrees);
    zrot[0][0] = cos(rad);
    zrot[0][1] = sin(rad);
    zrot[1][0] = -sin(rad);
    zrot[1][1] = cos(rad);

    MatrixMultiply(m, zrot, tmpmat);
    MatrixMultiply(tmpmat, im, rot);

    for (i = 0; i < 3; i++) {
        dst[i] = rot[i][0] * point[0] + rot[i][1] * point[1] + rot[i][2] * point[2];
    }
}

void RotateAroundDirection(vec3_t axis[3], float yaw)
{

    // create an arbitrary axis[1]
    PerpendicularVector(axis[1], axis[0]);

    // rotate it around axis[0] by yaw
    if (yaw) {
        vec3_t temp;

        VectorCopy(axis[1], temp);
        RotatePointAroundVector(axis[1], axis[0], temp, yaw);
    }

    // cross to get axis[2]
    CrossProduct(axis[0], axis[1], axis[2]);
}

void vectoangles(const vec3_t value1, vec3_t angles)
{
    float forward;
    float yaw, pitch;

    if (value1[1] == 0 && value1[0] == 0) {
        yaw = 0;
        if (value1[2] > 0) {
            pitch = 90;
        } else {
            pitch = 270;
        }
    } else {
        if (value1[0]) {
            yaw = (atan2(value1[1], value1[0]) * 180 / M_PI);
        } else if (value1[1] > 0) {
            yaw = 90;
        } else {
            yaw = 270;
        }
        if (yaw < 0) {
            yaw += 360;
        }

        forward = sqrt(value1[0] * value1[0] + value1[1] * value1[1]);
        pitch = (atan2(value1[2], forward) * 180 / M_PI);
        if (pitch < 0) {
            pitch += 360;
        }
    }

    angles[PITCH] = -pitch;
    angles[YAW] = yaw;
    angles[ROLL] = 0;
}

void AnglesToAxis(const vec3_t angles, vec3_t axis[3])
{
    vec3_t right;

    // angle vectors returns "right" instead of "y axis"
    AngleVectors(angles, axis[0], right, axis[2]);
    VectorSubtract(vec3_origin, right, axis[1]);
}

void AxisClear(vec3_t axis[3])
{
    axis[0][0] = 1;
    axis[0][1] = 0;
    axis[0][2] = 0;
    axis[1][0] = 0;
    axis[1][1] = 1;
    axis[1][2] = 0;
    axis[2][0] = 0;
    axis[2][1] = 0;
    axis[2][2] = 1;
}

void AxisCopy(vec3_t in[3], vec3_t out[3])
{
    VectorCopy(in[0], out[0]);
    VectorCopy(in[1], out[1]);
    VectorCopy(in[2], out[2]);
}

void ProjectPointOnPlane(vec3_t dst, const vec3_t p, const vec3_t normal)
{
    float d;
    vec3_t n;
    float inv_denom;

    inv_denom = DotProduct(normal, normal);
#ifndef Q3_VM
    assert(Q_fabs(inv_denom) != 0.0f);
#endif
    inv_denom = 1.0f / inv_denom;

    d = DotProduct(normal, p) * inv_denom;

    n[0] = normal[0] * inv_denom;
    n[1] = normal[1] * inv_denom;
    n[2] = normal[2] * inv_denom;

    dst[0] = p[0] - d * n[0];
    dst[1] = p[1] - d * n[1];
    dst[2] = p[2] - d * n[2];
}

/*
================
MakeNormalVectors

Given a normalized forward vector, create two
other perpendicular vectors
================
*/
void MakeNormalVectors(const vec3_t forward, vec3_t right, vec3_t up)
{
    float d;

    // this rotate and negate guarantees a vector
    // not colinear with the original
    right[1] = -forward[0];
    right[2] = forward[1];
    right[0] = forward[2];

    d = DotProduct(right, forward);
    VectorMA(right, -d, forward, right);
    VectorNormalize(right);
    CrossProduct(right, forward, up);
}

void VectorRotate(vec3_t in, vec3_t matrix[3], vec3_t out)
{
    out[0] = DotProduct(in, matrix[0]);
    out[1] = DotProduct(in, matrix[1]);
    out[2] = DotProduct(in, matrix[2]);
}

/*
** float q_rsqrt( float number )
*/
float Q_rsqrt(float number)
{
    long i;
    float x2, y;
    const float threehalfs = 1.5F;

    x2 = number * 0.5F;
    y = number;
    i = *(long*)&y; // evil floating point bit level hacking
    i = 0x5f3759df - (i >> 1); // what the fuck?
    y = *(float*)&i;
    y = y * (threehalfs - (x2 * y * y)); // 1st iteration
    //	y  = y * ( threehalfs - ( x2 * y * y ) );   // 2nd iteration, this can be removed

#ifndef Q3_VM
#ifdef __linux__
    assert(!isnan(y));
#endif
#endif
    return y;
}

float Q_fabs(float f)
{
    int tmp = *(int*)&f;
    tmp &= 0x7FFFFFFF;
    return *(float*)&tmp;
}

float LerpAngle(float from, float to, float frac)
{
    float a;

    if (to - from > 180) {
        to -= 360;
    }
    if (to - from < -180) {
        to += 360;
    }
    a = from + frac * (to - from);

    return a;
}

/*
=================
AngleSubtract

Always returns a value from -180 to 180
=================
*/
float AngleSubtract(float a1, float a2)
{
    float a;

    a = a1 - a2;
    while (a > 180) {
        a -= 360;
    }
    while (a < -180) {
        a += 360;
    }
    return a;
}

void AnglesSubtract(vec3_t v1, vec3_t v2, vec3_t v3)
{
    v3[0] = AngleSubtract(v1[0], v2[0]);
    v3[1] = AngleSubtract(v1[1], v2[1]);
    v3[2] = AngleSubtract(v1[2], v2[2]);
}

float AngleMod(float a)
{
    a = (360.0 / 65536) * ((int)(a * (65536 / 360.0)) & 65535);
    return a;
}

/*
=================
AngleNormalize360

returns angle normalized to the range [0 <= angle < 360]
=================
*/
float AngleNormalize360(float angle)
{
    return (360.0 / 65536) * ((int)(angle * (65536 / 360.0)) & 65535);
}

/*
=================
AngleNormalize180

returns angle normalized to the range [-180 < angle <= 180]
=================
*/
float AngleNormalize180(float angle)
{
    angle = AngleNormalize360(angle);
    if (angle > 180.0) {
        angle -= 360.0;
    }
    return angle;
}

void SetPlaneSignbits(cplane_t* out)
{
    int bits, j;

    // for fast box on planeside test
    bits = 0;
    for (j = 0; j < 3; j++) {
        if (out->normal[j] < 0) {
            bits |= 1 << j;
        }
    }
    out->signbits = bits;
}

/*
==================
BoxOnPlaneSide

Returns 1, 2, or 1 + 2

// this is the slow, general version
int BoxOnPlaneSide2 (vec3_t emins, vec3_t emaxs, struct cplane_s *p)
{
        int		i;
        float	dist1, dist2;
        int		sides;
        vec3_t	corners[2];

        for (i=0 ; i<3 ; i++)
        {
                if (p->normal[i] < 0)
                {
                        corners[0][i] = emins[i];
                        corners[1][i] = emaxs[i];
                }
                else
                {
                        corners[1][i] = emins[i];
                        corners[0][i] = emaxs[i];
                }
        }
        dist1 = DotProduct (p->normal, corners[0]) - p->dist;
        dist2 = DotProduct (p->normal, corners[1]) - p->dist;
        sides = 0;
        if (dist1 >= 0)
                sides = 1;
        if (dist2 < 0)
                sides |= 2;

        return sides;
}

==================
*/

#if !(defined __linux__ && (defined __i386__) && (!defined C_ONLY))

#if defined __LCC__ || defined C_ONLY || !id386 || defined __VECTORC

int BoxOnPlaneSide(vec3_t emins, vec3_t emaxs, struct cplane_s* p)
{
    float dist1, dist2;
    int sides;

    // fast axial cases
    if (p->type < 3) {
        if (p->dist <= emins[p->type])
            return 1;
        if (p->dist >= emaxs[p->type])
            return 2;
        return 3;
    }

    // general case
    switch (p->signbits) {
    case 0:
        dist1 = p->normal[0] * emaxs[0] + p->normal[1] * emaxs[1] + p->normal[2] * emaxs[2];
        dist2 = p->normal[0] * emins[0] + p->normal[1] * emins[1] + p->normal[2] * emins[2];
        break;
    case 1:
        dist1 = p->normal[0] * emins[0] + p->normal[1] * emaxs[1] + p->normal[2] * emaxs[2];
        dist2 = p->normal[0] * emaxs[0] + p->normal[1] * emins[1] + p->normal[2] * emins[2];
        break;
    case 2:
        dist1 = p->normal[0] * emaxs[0] + p->normal[1] * emins[1] + p->normal[2] * emaxs[2];
        dist2 = p->normal[0] * emins[0] + p->normal[1] * emaxs[1] + p->normal[2] * emins[2];
        break;
    case 3:
        dist1 = p->normal[0] * emins[0] + p->normal[1] * emins[1] + p->normal[2] * emaxs[2];
        dist2 = p->normal[0] * emaxs[0] + p->normal[1] * emaxs[1] + p->normal[2] * emins[2];
        break;
    case 4:
        dist1 = p->normal[0] * emaxs[0] + p->normal[1] * emaxs[1] + p->normal[2] * emins[2];
        dist2 = p->normal[0] * emins[0] + p->normal[1] * emins[1] + p->normal[2] * emaxs[2];
        break;
    case 5:
        dist1 = p->normal[0] * emins[0] + p->normal[1] * emaxs[1] + p->normal[2] * emins[2];
        dist2 = p->normal[0] * emaxs[0] + p->normal[1] * emins[1] + p->normal[2] * emaxs[2];
        break;
    case 6:
        dist1 = p->normal[0] * emaxs[0] + p->normal[1] * emins[1] + p->normal[2] * emins[2];
        dist2 = p->normal[0] * emins[0] + p->normal[1] * emaxs[1] + p->normal[2] * emaxs[2];
        break;
    case 7:
        dist1 = p->normal[0] * emins[0] + p->normal[1] * emins[1] + p->normal[2] * emins[2];
        dist2 = p->normal[0] * emaxs[0] + p->normal[1] * emaxs[1] + p->normal[2] * emaxs[2];
        break;
    default:
        dist1 = dist2 = 0; // shut up compiler
        break;
    }

    sides = 0;
    if (dist1 >= p->dist)
        sides = 1;
    if (dist2 < p->dist)
        sides |= 2;

    return sides;
}
#else
#pragma warning(disable : 4035)

__declspec(naked) int BoxOnPlaneSide(vec3_t emins, vec3_t emaxs, struct cplane_s* p)
{
    static int bops_initialized;
    static int Ljmptab[8];

    __asm {

		push ebx

		cmp bops_initialized, 1
		je  initialized
		mov bops_initialized, 1

		mov Ljmptab[0*4], offset Lcase0
		mov Ljmptab[1*4], offset Lcase1
		mov Ljmptab[2*4], offset Lcase2
		mov Ljmptab[3*4], offset Lcase3
		mov Ljmptab[4*4], offset Lcase4
		mov Ljmptab[5*4], offset Lcase5
		mov Ljmptab[6*4], offset Lcase6
		mov Ljmptab[7*4], offset Lcase7

initialized:

		mov edx,dword ptr[4+12+esp]
		mov ecx,dword ptr[4+4+esp]
		xor eax,eax
		mov ebx,dword ptr[4+8+esp]
		mov al,uint8_t ptr[17+edx]
		cmp al,8
		jge Lerror
		fld dword ptr[0+edx]
		fld st(0)
		jmp dword ptr[Ljmptab+eax*4]
Lcase0:
		fmul dword ptr[ebx]
		fld dword ptr[0+4+edx]
		fxch st(2)
		fmul dword ptr[ecx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[4+ebx]
		fld dword ptr[0+8+edx]
		fxch st(2)
		fmul dword ptr[4+ecx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[8+ebx]
		fxch st(5)
		faddp st(3),st(0)
		fmul dword ptr[8+ecx]
		fxch st(1)
		faddp st(3),st(0)
		fxch st(3)
		faddp st(2),st(0)
		jmp LSetSides
Lcase1:
		fmul dword ptr[ecx]
		fld dword ptr[0+4+edx]
		fxch st(2)
		fmul dword ptr[ebx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[4+ebx]
		fld dword ptr[0+8+edx]
		fxch st(2)
		fmul dword ptr[4+ecx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[8+ebx]
		fxch st(5)
		faddp st(3),st(0)
		fmul dword ptr[8+ecx]
		fxch st(1)
		faddp st(3),st(0)
		fxch st(3)
		faddp st(2),st(0)
		jmp LSetSides
Lcase2:
		fmul dword ptr[ebx]
		fld dword ptr[0+4+edx]
		fxch st(2)
		fmul dword ptr[ecx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[4+ecx]
		fld dword ptr[0+8+edx]
		fxch st(2)
		fmul dword ptr[4+ebx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[8+ebx]
		fxch st(5)
		faddp st(3),st(0)
		fmul dword ptr[8+ecx]
		fxch st(1)
		faddp st(3),st(0)
		fxch st(3)
		faddp st(2),st(0)
		jmp LSetSides
Lcase3:
		fmul dword ptr[ecx]
		fld dword ptr[0+4+edx]
		fxch st(2)
		fmul dword ptr[ebx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[4+ecx]
		fld dword ptr[0+8+edx]
		fxch st(2)
		fmul dword ptr[4+ebx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[8+ebx]
		fxch st(5)
		faddp st(3),st(0)
		fmul dword ptr[8+ecx]
		fxch st(1)
		faddp st(3),st(0)
		fxch st(3)
		faddp st(2),st(0)
		jmp LSetSides
Lcase4:
		fmul dword ptr[ebx]
		fld dword ptr[0+4+edx]
		fxch st(2)
		fmul dword ptr[ecx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[4+ebx]
		fld dword ptr[0+8+edx]
		fxch st(2)
		fmul dword ptr[4+ecx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[8+ecx]
		fxch st(5)
		faddp st(3),st(0)
		fmul dword ptr[8+ebx]
		fxch st(1)
		faddp st(3),st(0)
		fxch st(3)
		faddp st(2),st(0)
		jmp LSetSides
Lcase5:
		fmul dword ptr[ecx]
		fld dword ptr[0+4+edx]
		fxch st(2)
		fmul dword ptr[ebx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[4+ebx]
		fld dword ptr[0+8+edx]
		fxch st(2)
		fmul dword ptr[4+ecx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[8+ecx]
		fxch st(5)
		faddp st(3),st(0)
		fmul dword ptr[8+ebx]
		fxch st(1)
		faddp st(3),st(0)
		fxch st(3)
		faddp st(2),st(0)
		jmp LSetSides
Lcase6:
		fmul dword ptr[ebx]
		fld dword ptr[0+4+edx]
		fxch st(2)
		fmul dword ptr[ecx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[4+ecx]
		fld dword ptr[0+8+edx]
		fxch st(2)
		fmul dword ptr[4+ebx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[8+ecx]
		fxch st(5)
		faddp st(3),st(0)
		fmul dword ptr[8+ebx]
		fxch st(1)
		faddp st(3),st(0)
		fxch st(3)
		faddp st(2),st(0)
		jmp LSetSides
Lcase7:
		fmul dword ptr[ecx]
		fld dword ptr[0+4+edx]
		fxch st(2)
		fmul dword ptr[ebx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[4+ecx]
		fld dword ptr[0+8+edx]
		fxch st(2)
		fmul dword ptr[4+ebx]
		fxch st(2)
		fld st(0)
		fmul dword ptr[8+ecx]
		fxch st(5)
		faddp st(3),st(0)
		fmul dword ptr[8+ebx]
		fxch st(1)
		faddp st(3),st(0)
		fxch st(3)
		faddp st(2),st(0)
LSetSides:
		faddp st(2),st(0)
		fcomp dword ptr[12+edx]
		xor ecx,ecx
		fnstsw ax
		fcomp dword ptr[12+edx]
		and ah,1
		xor ah,1
		add cl,ah
		fnstsw ax
		and ah,1
		add ah,ah
		add cl,ah
		pop ebx
		mov eax,ecx
		ret
Lerror:
		int 3
    }
}
#pragma warning(default : 4035)

#endif
#endif

float RadiusFromBounds(const vec3_t mins, const vec3_t maxs)
{
    int i;
    vec3_t corner;
    float a, b;

    for (i = 0; i < 3; i++) {
        a = fabs(mins[i]);
        b = fabs(maxs[i]);
        corner[i] = a > b ? a : b;
    }

    return VectorLength(corner);
}

void ClearBounds(vec3_t mins, vec3_t maxs)
{
    mins[0] = mins[1] = mins[2] = 99999;
    maxs[0] = maxs[1] = maxs[2] = -99999;
}

void AddPointToBounds(const vec3_t v, vec3_t mins, vec3_t maxs)
{
    if (v[0] < mins[0]) {
        mins[0] = v[0];
    }
    if (v[0] > maxs[0]) {
        maxs[0] = v[0];
    }

    if (v[1] < mins[1]) {
        mins[1] = v[1];
    }
    if (v[1] > maxs[1]) {
        maxs[1] = v[1];
    }

    if (v[2] < mins[2]) {
        mins[2] = v[2];
    }
    if (v[2] > maxs[2]) {
        maxs[2] = v[2];
    }
}

vec_t VectorNormalize(vec3_t v)
{
    float length, ilength;

    length = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
    length = sqrt(length);

    if (length) {
        ilength = 1 / length;
        v[0] *= ilength;
        v[1] *= ilength;
        v[2] *= ilength;
    }

    return length;
}

vec_t VectorNormalize2(const vec3_t v, vec3_t out)
{
    float length, ilength;

    length = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
    length = sqrt(length);

    if (length) {
        ilength = 1 / length;
        out[0] = v[0] * ilength;
        out[1] = v[1] * ilength;
        out[2] = v[2] * ilength;
    } else {
        VectorClear(out);
    }

    return length;
}

void MatrixMultiply(float in1[3][3], float in2[3][3], float out[3][3])
{
    out[0][0] = in1[0][0] * in2[0][0] + in1[0][1] * in2[1][0] + in1[0][2] * in2[2][0];
    out[0][1] = in1[0][0] * in2[0][1] + in1[0][1] * in2[1][1] + in1[0][2] * in2[2][1];
    out[0][2] = in1[0][0] * in2[0][2] + in1[0][1] * in2[1][2] + in1[0][2] * in2[2][2];
    out[1][0] = in1[1][0] * in2[0][0] + in1[1][1] * in2[1][0] + in1[1][2] * in2[2][0];
    out[1][1] = in1[1][0] * in2[0][1] + in1[1][1] * in2[1][1] + in1[1][2] * in2[2][1];
    out[1][2] = in1[1][0] * in2[0][2] + in1[1][1] * in2[1][2] + in1[1][2] * in2[2][2];
    out[2][0] = in1[2][0] * in2[0][0] + in1[2][1] * in2[1][0] + in1[2][2] * in2[2][0];
    out[2][1] = in1[2][0] * in2[0][1] + in1[2][1] * in2[1][1] + in1[2][2] * in2[2][1];
    out[2][2] = in1[2][0] * in2[0][2] + in1[2][1] * in2[1][2] + in1[2][2] * in2[2][2];
}

void AngleVectors(const vec3_t angles, vec3_t forward, vec3_t right, vec3_t up)
{
    float angle;
    static float sr, sp, sy, cr, cp, cy;
    // static to help MS compiler fp bugs

    angle = angles[YAW] * (M_PI * 2 / 360);
    sy = sin(angle);
    cy = cos(angle);
    angle = angles[PITCH] * (M_PI * 2 / 360);
    sp = sin(angle);
    cp = cos(angle);
    angle = angles[ROLL] * (M_PI * 2 / 360);
    sr = sin(angle);
    cr = cos(angle);

    if (forward) {
        forward[0] = cp * cy;
        forward[1] = cp * sy;
        forward[2] = -sp;
    }
    if (right) {
        right[0] = (-1 * sr * sp * cy + -1 * cr * -sy);
        right[1] = (-1 * sr * sp * sy + -1 * cr * cy);
        right[2] = -1 * sr * cp;
    }
    if (up) {
        up[0] = (cr * sp * cy + -sr * -sy);
        up[1] = (cr * sp * sy + -sr * cy);
        up[2] = cr * cp;
    }
}

/*
** assumes "src" is normalized
*/
void PerpendicularVector(vec3_t dst, const vec3_t src)
{
    int pos;
    int i;
    float minelem = 1.0F;
    vec3_t tempvec;

    /*
    ** find the smallest magnitude axially aligned vector
    */
    for (pos = 0, i = 0; i < 3; i++) {
        if (fabs(src[i]) < minelem) {
            pos = i;
            minelem = fabs(src[i]);
        }
    }
    tempvec[0] = tempvec[1] = tempvec[2] = 0.0F;
    tempvec[pos] = 1.0F;

    /*
    ** project the point onto the plane defined by src
    */
    ProjectPointOnPlane(dst, tempvec, src);

    /*
    ** normalize the result
    */
    VectorNormalize(dst);
}
