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
// tr_models.c -- model loading and caching

#include "tr_local.h"
#include "lang_util.h"

#define LL(x) x = LittleLong(x)

static bool R_LoadMD3(model_t* mod, int lod, void* buffer, const char* modName);

/*
====================
R_RegisterMD3
====================
*/
static qhandle_t R_RegisterMD3(const char* name, model_t* mod)
{
    union {
        unsigned* u;
        void* v;
    } buf;
    int lod;
    int ident;
    bool loaded = false;
    int numLoaded;
    char filename[MAX_QPATH], namebuf[MAX_QPATH + 20];
    char *fext, defex[] = "md3";

    numLoaded = 0;

    strcpy(filename, name);

    fext = strchr(filename, '.');
    if (!fext)
        fext = defex;
    else {
        *fext = '\0';
        fext++;
    }

    for (lod = MD3_MAX_LODS - 1; lod >= 0; lod--) {
        if (lod)
            Com_sprintf(namebuf, sizeof(namebuf), "%s_%d.%s", filename, lod, fext);
        else
            Com_sprintf(namebuf, sizeof(namebuf), "%s.%s", filename, fext);

        ri.FS_ReadFile(namebuf, &buf.v);
        if (!buf.u)
            continue;

        ident = LittleLong(*(unsigned*)buf.u);
        if (ident == MD3_IDENT)
            loaded = R_LoadMD3(mod, lod, buf.u, name);
        else
            ri.Printf(PRINT_WARNING, "R_RegisterMD3: unknown fileid for %s\n", name);

        ri.FS_FreeFile(buf.v);

        if (loaded) {
            mod->numLods++;
            numLoaded++;
        } else
            break;
    }

    if (numLoaded) {
        // duplicate into higher lod spots that weren't
        // loaded, in case the user changes r_lodbias on the fly
        for (lod--; lod >= 0; lod--) {
            mod->numLods++;
            mod->mdv[lod] = mod->mdv[lod + 1];
        }

        return mod->index;
    }

#ifdef _DEBUG
    ri.Printf(PRINT_WARNING, "R_RegisterMD3: couldn't load %s\n", name);
#endif

    mod->type = MOD_BAD;
    return 0;
}

typedef struct
{
    char* ext;
    qhandle_t (*ModelLoader)(const char*, model_t*);
} modelExtToLoaderMap_t;

// Note that the ordering indicates the order of preference used
// when there are multiple models of different formats available
static modelExtToLoaderMap_t modelLoaders[] = {
    { "md3", R_RegisterMD3 }
};

model_t* R_GetModelByHandle(qhandle_t index)
{
    model_t* mod;

    // out of range gets the default model
    if (index < 1 || index >= tr.numModels) {
        return tr.models[0];
    }

    mod = tr.models[index];

    return mod;
}

model_t* R_AllocModel()
{
    model_t* mod;

    if (tr.numModels == MAX_MOD_KNOWN) {
        return NULL;
    }

    mod = ri.Hunk_Alloc(sizeof(*tr.models[tr.numModels]), h_low);
    mod->index = tr.numModels;
    tr.models[tr.numModels] = mod;
    tr.numModels++;

    return mod;
}

/*
====================
RE_RegisterModel

Loads in a model for the given name

Zero will be returned if the model fails to load.
An entry will be retained for failed models as an
optimization to prevent disk rescanning if they are
asked for again.
====================
*/
qhandle_t RE_RegisterModel(const char* name)
{
    model_t* mod;
    qhandle_t hModel;
    bool orgNameFailed = false;
    int orgLoader = -1;
    char localName[MAX_QPATH];
    const char* ext;
    char altName[MAX_QPATH];

    if (!name || !name[0]) {
        ri.Printf(PRINT_ALL, "RE_RegisterModel: NULL name\n");
        return 0;
    }

    if (strlen(name) >= MAX_QPATH) {
        ri.Printf(PRINT_ALL, "Model name exceeds MAX_QPATH\n");
        return 0;
    }

    // search the currently loaded models
    for (hModel = 1; hModel < tr.numModels; hModel++) {
        mod = tr.models[hModel];
        if (!strcmp(mod->name, name)) {
            if (mod->type == MOD_BAD) {
                return 0;
            }
            return hModel;
        }
    }

    // allocate a new model_t

    if ((mod = R_AllocModel()) == NULL) {
        ri.Printf(PRINT_WARNING, "RE_RegisterModel: R_AllocModel() failed for '%s'\n", name);
        return 0;
    }

    // only set the name after the model has been successfully loaded
    strncpyz(mod->name, name, sizeof(mod->name));

    R_IssuePendingRenderCommands();

    mod->type = MOD_BAD;
    mod->numLods = 0;

    // load the files
    strncpyz(localName, name, sizeof(localName));

    ext = COM_GetExtension(localName);

    if (*ext) {
        // Look for the correct loader and use it
        int i;
        for (i = 0; i < COUNT_OF(modelLoaders); i++) {
            if (!Q_stricmp(ext, modelLoaders[i].ext)) {
                // Load
                hModel = modelLoaders[i].ModelLoader(localName, mod);
                break;
            }
        }

        // A loader was found
        if (i < COUNT_OF(modelLoaders)) {
            if (!hModel) {
                // Loader failed, most likely because the file isn't there;
                // try again without the extension
                orgNameFailed = true;
                orgLoader = i;
                COM_StripExtension(name, localName, MAX_QPATH);
            } else {
                // Something loaded
                return mod->index;
            }
        }
    }

    // Try and find a suitable match using all
    // the model formats supported
    for (int i = 0; i < COUNT_OF(modelLoaders); i++) {
        if (i == orgLoader)
            continue;

        Com_sprintf(altName, sizeof(altName), "%s.%s", localName, modelLoaders[i].ext);

        // Load
        hModel = modelLoaders[i].ModelLoader(altName, mod);

        if (hModel) {
            if (orgNameFailed) {
                ri.Printf(PRINT_DEVELOPER, "WARNING: %s not present, using %s instead\n",
                          name, altName);
            }

            break;
        }
    }

    return hModel;
}

/*
=================
R_LoadMD3
=================
*/
static bool R_LoadMD3(model_t* mod, int lod, void* buffer, const char* modName)
{
    int f, i, j;

    md3Header_t* md3Model;
    md3Frame_t* md3Frame;
    md3Surface_t* md3Surf;
    md3Shader_t* md3Shader;
    md3Triangle_t* md3Tri;
    md3St_t* md3st;
    md3XyzNormal_t* md3xyz;
    md3Tag_t* md3Tag;

    mdvModel_t* mdvModel;
    mdvFrame_t* frame;
    mdvSurface_t* surf; //, *surface;
    int* shaderIndex;
    glIndex_t* tri;
    mdvVertex_t* v;
    mdvSt_t* st;
    mdvTag_t* tag;
    mdvTagName_t* tagName;

    int version;
    int size;

    md3Model = (md3Header_t*)buffer;

    version = LittleLong(md3Model->version);
    if (version != MD3_VERSION) {
        ri.Printf(PRINT_WARNING, "R_LoadMD3: %s has wrong version (%i should be %i)\n", modName, version, MD3_VERSION);
        return false;
    }

    mod->type = MOD_MESH;
    size = LittleLong(md3Model->ofsEnd);
    mod->dataSize += size;
    mdvModel = mod->mdv[lod] = ri.Hunk_Alloc(sizeof(mdvModel_t), h_low);

    //  memcpy(mod->md3[lod], buffer, LittleLong(md3Model->ofsEnd));

    LL(md3Model->ident);
    LL(md3Model->version);
    LL(md3Model->numFrames);
    LL(md3Model->numTags);
    LL(md3Model->numSurfaces);
    LL(md3Model->ofsFrames);
    LL(md3Model->ofsTags);
    LL(md3Model->ofsSurfaces);
    LL(md3Model->ofsEnd);

    if (md3Model->numFrames < 1) {
        ri.Printf(PRINT_WARNING, "R_LoadMD3: %s has no frames\n", modName);
        return false;
    }

    // swap all the frames
    mdvModel->numFrames = md3Model->numFrames;
    mdvModel->frames = frame = ri.Hunk_Alloc(sizeof(*frame) * md3Model->numFrames, h_low);

    md3Frame = (md3Frame_t*)((uint8_t*)md3Model + md3Model->ofsFrames);
    for (i = 0; i < md3Model->numFrames; i++, frame++, md3Frame++) {
        frame->radius = LittleFloat(md3Frame->radius);
        for (j = 0; j < 3; j++) {
            frame->bounds[0][j] = LittleFloat(md3Frame->bounds[0][j]);
            frame->bounds[1][j] = LittleFloat(md3Frame->bounds[1][j]);
            frame->localOrigin[j] = LittleFloat(md3Frame->localOrigin[j]);
        }
    }

    // swap all the tags
    mdvModel->numTags = md3Model->numTags;
    mdvModel->tags = tag = ri.Hunk_Alloc(sizeof(*tag) * (md3Model->numTags * md3Model->numFrames), h_low);

    md3Tag = (md3Tag_t*)((uint8_t*)md3Model + md3Model->ofsTags);
    for (i = 0; i < md3Model->numTags * md3Model->numFrames; i++, tag++, md3Tag++) {
        for (j = 0; j < 3; j++) {
            tag->origin[j] = LittleFloat(md3Tag->origin[j]);
            tag->axis[0][j] = LittleFloat(md3Tag->axis[0][j]);
            tag->axis[1][j] = LittleFloat(md3Tag->axis[1][j]);
            tag->axis[2][j] = LittleFloat(md3Tag->axis[2][j]);
        }
    }

    mdvModel->tagNames = tagName = ri.Hunk_Alloc(sizeof(*tagName) * (md3Model->numTags), h_low);

    md3Tag = (md3Tag_t*)((uint8_t*)md3Model + md3Model->ofsTags);
    for (i = 0; i < md3Model->numTags; i++, tagName++, md3Tag++) {
        strncpyz(tagName->name, md3Tag->name, sizeof(tagName->name));
    }

    // swap all the surfaces
    mdvModel->numSurfaces = md3Model->numSurfaces;
    mdvModel->surfaces = surf = ri.Hunk_Alloc(sizeof(*surf) * md3Model->numSurfaces, h_low);

    md3Surf = (md3Surface_t*)((uint8_t*)md3Model + md3Model->ofsSurfaces);
    for (i = 0; i < md3Model->numSurfaces; i++) {
        LL(md3Surf->ident);
        LL(md3Surf->flags);
        LL(md3Surf->numFrames);
        LL(md3Surf->numShaders);
        LL(md3Surf->numTriangles);
        LL(md3Surf->ofsTriangles);
        LL(md3Surf->numVerts);
        LL(md3Surf->ofsShaders);
        LL(md3Surf->ofsSt);
        LL(md3Surf->ofsXyzNormals);
        LL(md3Surf->ofsEnd);

        if (md3Surf->numVerts >= SHADER_MAX_VERTEXES) {
            ri.Printf(PRINT_WARNING, "R_LoadMD3: %s has more than %i verts on %s (%i).\n",
                      modName, SHADER_MAX_VERTEXES - 1, md3Surf->name[0] ? md3Surf->name : "a surface",
                      md3Surf->numVerts);
            return false;
        }
        if (md3Surf->numTriangles * 3 >= SHADER_MAX_INDEXES) {
            ri.Printf(PRINT_WARNING, "R_LoadMD3: %s has more than %i triangles on %s (%i).\n",
                      modName, (SHADER_MAX_INDEXES / 3) - 1, md3Surf->name[0] ? md3Surf->name : "a surface",
                      md3Surf->numTriangles);
            return false;
        }

        // change to surface identifier
        surf->surfaceType = SF_MDV;

        // give pointer to model for Tess_SurfaceMDX
        surf->model = mdvModel;

        // copy surface name
        strncpyz(surf->name, md3Surf->name, sizeof(surf->name));

        // lowercase the surface name so skin compares are faster
        Q_strlwr(surf->name);

        // strip off a trailing _1 or _2
        // this is a crutch for q3data being a mess
        j = strlen(surf->name);
        if (j > 2 && surf->name[j - 2] == '_') {
            surf->name[j - 2] = 0;
        }

        // register the shaders
        surf->numShaderIndexes = md3Surf->numShaders;
        surf->shaderIndexes = shaderIndex = ri.Hunk_Alloc(sizeof(*shaderIndex) * md3Surf->numShaders, h_low);

        md3Shader = (md3Shader_t*)((uint8_t*)md3Surf + md3Surf->ofsShaders);
        for (j = 0; j < md3Surf->numShaders; j++, shaderIndex++, md3Shader++) {
            shader_t* sh;

            sh = R_FindShader(md3Shader->name, LIGHTMAP_NONE, true);
            if (sh->defaultShader) {
                *shaderIndex = 0;
            } else {
                *shaderIndex = sh->index;
            }
        }

        // swap all the triangles
        surf->numIndexes = md3Surf->numTriangles * 3;
        surf->indexes = tri = ri.Hunk_Alloc(sizeof(*tri) * 3 * md3Surf->numTriangles, h_low);

        md3Tri = (md3Triangle_t*)((uint8_t*)md3Surf + md3Surf->ofsTriangles);
        for (j = 0; j < md3Surf->numTriangles; j++, tri += 3, md3Tri++) {
            tri[0] = LittleLong(md3Tri->indexes[0]);
            tri[1] = LittleLong(md3Tri->indexes[1]);
            tri[2] = LittleLong(md3Tri->indexes[2]);
        }

        // swap all the XyzNormals
        surf->numVerts = md3Surf->numVerts;
        surf->verts = v = ri.Hunk_Alloc(sizeof(*v) * (md3Surf->numVerts * md3Surf->numFrames), h_low);

        md3xyz = (md3XyzNormal_t*)((uint8_t*)md3Surf + md3Surf->ofsXyzNormals);
        for (j = 0; j < md3Surf->numVerts * md3Surf->numFrames; j++, md3xyz++, v++) {
            unsigned lat, lng;
            unsigned short normal;
            vec3_t fNormal;

            v->xyz[0] = LittleShort(md3xyz->xyz[0]) * MD3_XYZ_SCALE;
            v->xyz[1] = LittleShort(md3xyz->xyz[1]) * MD3_XYZ_SCALE;
            v->xyz[2] = LittleShort(md3xyz->xyz[2]) * MD3_XYZ_SCALE;

            normal = LittleShort(md3xyz->normal);

            lat = (normal >> 8) & 0xff;
            lng = (normal & 0xff);
            lat *= (FUNCTABLE_SIZE / 256);
            lng *= (FUNCTABLE_SIZE / 256);

            // decode X as cos( lat ) * sin( long )
            // decode Y as sin( lat ) * sin( long )
            // decode Z as cos( long )

            fNormal[0] = tr.sinTable[(lat + (FUNCTABLE_SIZE / 4)) & FUNCTABLE_MASK] * tr.sinTable[lng];
            fNormal[1] = tr.sinTable[lat] * tr.sinTable[lng];
            fNormal[2] = tr.sinTable[(lng + (FUNCTABLE_SIZE / 4)) & FUNCTABLE_MASK];

            R_VaoPackNormal(v->normal, fNormal);
        }

        // swap all the ST
        surf->st = st = ri.Hunk_Alloc(sizeof(*st) * md3Surf->numVerts, h_low);

        md3st = (md3St_t*)((uint8_t*)md3Surf + md3Surf->ofsSt);
        for (j = 0; j < md3Surf->numVerts; j++, md3st++, st++) {
            st->st[0] = LittleFloat(md3st->st[0]);
            st->st[1] = LittleFloat(md3st->st[1]);
        }

        // calc tangent spaces
        {
            vec3_t* sdirs = ri.Malloc(sizeof(*sdirs) * surf->numVerts * mdvModel->numFrames);
            vec3_t* tdirs = ri.Malloc(sizeof(*tdirs) * surf->numVerts * mdvModel->numFrames);

            for (j = 0, v = surf->verts; j < (surf->numVerts * mdvModel->numFrames); j++, v++) {
                VectorClear(sdirs[j]);
                VectorClear(tdirs[j]);
            }

            for (f = 0; f < mdvModel->numFrames; f++) {
                for (j = 0, tri = surf->indexes; j < surf->numIndexes; j += 3, tri += 3) {
                    vec3_t sdir, tdir;
                    const float *v0, *v1, *v2, *t0, *t1, *t2;
                    glIndex_t index0, index1, index2;

                    index0 = surf->numVerts * f + tri[0];
                    index1 = surf->numVerts * f + tri[1];
                    index2 = surf->numVerts * f + tri[2];

                    v0 = surf->verts[index0].xyz;
                    v1 = surf->verts[index1].xyz;
                    v2 = surf->verts[index2].xyz;

                    t0 = surf->st[tri[0]].st;
                    t1 = surf->st[tri[1]].st;
                    t2 = surf->st[tri[2]].st;

                    R_CalcTexDirs(sdir, tdir, v0, v1, v2, t0, t1, t2);

                    VectorAdd(sdir, sdirs[index0], sdirs[index0]);
                    VectorAdd(sdir, sdirs[index1], sdirs[index1]);
                    VectorAdd(sdir, sdirs[index2], sdirs[index2]);
                    VectorAdd(tdir, tdirs[index0], tdirs[index0]);
                    VectorAdd(tdir, tdirs[index1], tdirs[index1]);
                    VectorAdd(tdir, tdirs[index2], tdirs[index2]);
                }
            }

            for (j = 0, v = surf->verts; j < (surf->numVerts * mdvModel->numFrames); j++, v++) {
                vec3_t normal;
                vec4_t tangent;

                VectorNormalize(sdirs[j]);
                VectorNormalize(tdirs[j]);

                R_VaoUnpackNormal(normal, v->normal);

                tangent[3] = R_CalcTangentSpace(tangent, NULL, normal, sdirs[j], tdirs[j]);

                R_VaoPackTangent(v->tangent, tangent);
            }

            ri.Free(sdirs);
            ri.Free(tdirs);
        }

        // find the next surface
        md3Surf = (md3Surface_t*)((uint8_t*)md3Surf + md3Surf->ofsEnd);
        surf++;
    }

    {
        srfVaoMdvMesh_t* vaoSurf;

        mdvModel->numVaoSurfaces = mdvModel->numSurfaces;
        mdvModel->vaoSurfaces = ri.Hunk_Alloc(sizeof(*mdvModel->vaoSurfaces) * mdvModel->numSurfaces, h_low);

        vaoSurf = mdvModel->vaoSurfaces;
        surf = mdvModel->surfaces;
        for (i = 0; i < mdvModel->numSurfaces; i++, vaoSurf++, surf++) {
            uint32_t offset_xyz, offset_st, offset_normal, offset_tangent;
            uint32_t stride_xyz, stride_st, stride_normal, stride_tangent;
            uint32_t dataSize, dataOfs;
            uint8_t* data;

            if (mdvModel->numFrames > 1) {
                // vertex animation, store texcoords first, then position/normal/tangents
                offset_st = 0;
                offset_xyz = surf->numVerts * sizeof(vec2_t);
                offset_normal = offset_xyz + sizeof(vec3_t);
                offset_tangent = offset_normal + sizeof(int16_t) * 4;
                stride_st = sizeof(vec2_t);
                stride_xyz = sizeof(vec3_t) + sizeof(int16_t) * 4;
                stride_xyz += sizeof(int16_t) * 4;
                stride_normal = stride_tangent = stride_xyz;

                dataSize = offset_xyz + surf->numVerts * mdvModel->numFrames * stride_xyz;
            } else {
                // no animation, interleave everything
                offset_xyz = 0;
                offset_st = offset_xyz + sizeof(vec3_t);
                offset_normal = offset_st + sizeof(vec2_t);
                offset_tangent = offset_normal + sizeof(int16_t) * 4;
                stride_xyz = offset_tangent + sizeof(int16_t) * 4;
                stride_st = stride_normal = stride_tangent = stride_xyz;

                dataSize = surf->numVerts * stride_xyz;
            }

            data = ri.Malloc(dataSize);
            dataOfs = 0;

            if (mdvModel->numFrames > 1) {
                st = surf->st;
                for (j = 0; j < surf->numVerts; j++, st++) {
                    memcpy(data + dataOfs, &st->st, sizeof(vec2_t));
                    dataOfs += sizeof(st->st);
                }

                v = surf->verts;
                for (j = 0; j < surf->numVerts * mdvModel->numFrames; j++, v++) {
                    // xyz
                    memcpy(data + dataOfs, &v->xyz, sizeof(vec3_t));
                    dataOfs += sizeof(vec3_t);

                    // normal
                    memcpy(data + dataOfs, &v->normal, sizeof(int16_t) * 4);
                    dataOfs += sizeof(int16_t) * 4;

                    // tangent
                    memcpy(data + dataOfs, &v->tangent, sizeof(int16_t) * 4);
                    dataOfs += sizeof(int16_t) * 4;
                }
            } else {
                v = surf->verts;
                st = surf->st;
                for (j = 0; j < surf->numVerts; j++, v++, st++) {
                    // xyz
                    memcpy(data + dataOfs, &v->xyz, sizeof(vec3_t));
                    dataOfs += sizeof(v->xyz);

                    // st
                    memcpy(data + dataOfs, &st->st, sizeof(vec2_t));
                    dataOfs += sizeof(st->st);

                    // normal
                    memcpy(data + dataOfs, &v->normal, sizeof(int16_t) * 4);
                    dataOfs += sizeof(int16_t) * 4;

                    // tangent
                    memcpy(data + dataOfs, &v->tangent, sizeof(int16_t) * 4);
                    dataOfs += sizeof(int16_t) * 4;
                }
            }

            vaoSurf->surfaceType = SF_VAO_MDVMESH;
            vaoSurf->mdvModel = mdvModel;
            vaoSurf->mdvSurface = surf;
            vaoSurf->numIndexes = surf->numIndexes;
            vaoSurf->numVerts = surf->numVerts;

            vaoSurf->vao = R_CreateVao(va("staticMD3Mesh_VAO '%s'", surf->name), data, dataSize, (uint8_t*)surf->indexes, surf->numIndexes * sizeof(*surf->indexes), VAO_USAGE_STATIC);

            vaoSurf->vao->attribs[ATTR_INDEX_POSITION].enabled = 1;
            vaoSurf->vao->attribs[ATTR_INDEX_TEXCOORD].enabled = 1;
            vaoSurf->vao->attribs[ATTR_INDEX_NORMAL].enabled = 1;
            vaoSurf->vao->attribs[ATTR_INDEX_TANGENT].enabled = 1;

            vaoSurf->vao->attribs[ATTR_INDEX_POSITION].count = 3;
            vaoSurf->vao->attribs[ATTR_INDEX_TEXCOORD].count = 2;
            vaoSurf->vao->attribs[ATTR_INDEX_NORMAL].count = 4;
            vaoSurf->vao->attribs[ATTR_INDEX_TANGENT].count = 4;

            vaoSurf->vao->attribs[ATTR_INDEX_POSITION].type = GL_FLOAT;
            vaoSurf->vao->attribs[ATTR_INDEX_TEXCOORD].type = GL_FLOAT;
            vaoSurf->vao->attribs[ATTR_INDEX_NORMAL].type = GL_SHORT;
            vaoSurf->vao->attribs[ATTR_INDEX_TANGENT].type = GL_SHORT;

            vaoSurf->vao->attribs[ATTR_INDEX_POSITION].normalized = GL_FALSE;
            vaoSurf->vao->attribs[ATTR_INDEX_TEXCOORD].normalized = GL_FALSE;
            vaoSurf->vao->attribs[ATTR_INDEX_NORMAL].normalized = GL_TRUE;
            vaoSurf->vao->attribs[ATTR_INDEX_TANGENT].normalized = GL_TRUE;

            vaoSurf->vao->attribs[ATTR_INDEX_POSITION].offset = offset_xyz;
            vaoSurf->vao->attribs[ATTR_INDEX_TEXCOORD].offset = offset_st;
            vaoSurf->vao->attribs[ATTR_INDEX_NORMAL].offset = offset_normal;
            vaoSurf->vao->attribs[ATTR_INDEX_TANGENT].offset = offset_tangent;

            vaoSurf->vao->attribs[ATTR_INDEX_POSITION].stride = stride_xyz;
            vaoSurf->vao->attribs[ATTR_INDEX_TEXCOORD].stride = stride_st;
            vaoSurf->vao->attribs[ATTR_INDEX_NORMAL].stride = stride_normal;
            vaoSurf->vao->attribs[ATTR_INDEX_TANGENT].stride = stride_tangent;

            if (mdvModel->numFrames > 1) {
                vaoSurf->vao->attribs[ATTR_INDEX_POSITION2] = vaoSurf->vao->attribs[ATTR_INDEX_POSITION];
                vaoSurf->vao->attribs[ATTR_INDEX_NORMAL2] = vaoSurf->vao->attribs[ATTR_INDEX_NORMAL];
                vaoSurf->vao->attribs[ATTR_INDEX_TANGENT2] = vaoSurf->vao->attribs[ATTR_INDEX_TANGENT];

                vaoSurf->vao->frameSize = stride_xyz * surf->numVerts;
            }

            Vao_SetVertexPointers(vaoSurf->vao);

            ri.Free(data);
        }
    }

    return true;
}

void RE_BeginRegistration(glconfig_t* glconfigOut)
{
    int i;

    R_Init();

    *glconfigOut = glConfig;

    R_IssuePendingRenderCommands();

    tr.visIndex = 0;
    // force markleafs to regenerate
    for (i = 0; i < MAX_VISCOUNTS; i++) {
        tr.visClusters[i] = -2;
    }

    R_ClearFlares();
    RE_ClearScene();

    tr.registered = true;
}

void R_ModelInit()
{
    model_t* mod;

    // leave a space for NULL model
    tr.numModels = 0;

    mod = R_AllocModel();
    mod->type = MOD_BAD;
}

void R_Modellist_f()
{
    int i, j;
    model_t* mod;
    int total;
    int lods;

    total = 0;
    for (i = 1; i < tr.numModels; i++) {
        mod = tr.models[i];
        lods = 1;
        for (j = 1; j < MD3_MAX_LODS; j++) {
            if (mod->mdv[j] && mod->mdv[j] != mod->mdv[j - 1]) {
                lods++;
            }
        }
        ri.Printf(PRINT_ALL, "%8i : (%i) %s\n", mod->dataSize, lods, mod->name);
        total += mod->dataSize;
    }
    ri.Printf(PRINT_ALL, "%8i : Total models\n", total);

#if 0 // not working right with new hunk
	if ( tr.world ) {
		ri.Printf( PRINT_ALL, "\n%8i : %s\n", tr.world->dataSize, tr.world->name );
	}
#endif
}

static mdvTag_t* R_GetTag(mdvModel_t* mod, int frame, const char* _tagName)
{
    int i;
    mdvTag_t* tag;
    mdvTagName_t* tagName;

    if (frame >= mod->numFrames) {
        // it is possible to have a bad frame while changing models, so don't error
        frame = mod->numFrames - 1;
    }

    tag = mod->tags + frame * mod->numTags;
    tagName = mod->tagNames;
    for (i = 0; i < mod->numTags; i++, tag++, tagName++) {
        if (!strcmp(tagName->name, _tagName)) {
            return tag;
        }
    }

    return NULL;
}

int R_LerpTag(orientation_t* tag, qhandle_t handle, int startFrame, int endFrame,
              float frac, const char* tagName)
{
    mdvTag_t *start, *end;
    int i;
    float frontLerp, backLerp;
    model_t* model;

    model = R_GetModelByHandle(handle);
    if (!model->mdv[0]) {
        start = end = NULL;
    } else {
        start = R_GetTag(model->mdv[0], startFrame, tagName);
        end = R_GetTag(model->mdv[0], endFrame, tagName);
    }

    if (!start || !end) {
        AxisClear(tag->axis);
        VectorClear(tag->origin);
        return false;
    }

    frontLerp = frac;
    backLerp = 1.0f - frac;

    for (i = 0; i < 3; i++) {
        tag->origin[i] = start->origin[i] * backLerp + end->origin[i] * frontLerp;
        tag->axis[0][i] = start->axis[0][i] * backLerp + end->axis[0][i] * frontLerp;
        tag->axis[1][i] = start->axis[1][i] * backLerp + end->axis[1][i] * frontLerp;
        tag->axis[2][i] = start->axis[2][i] * backLerp + end->axis[2][i] * frontLerp;
    }
    VectorNormalize(tag->axis[0]);
    VectorNormalize(tag->axis[1]);
    VectorNormalize(tag->axis[2]);
    return true;
}

void R_ModelBounds(qhandle_t handle, vec3_t mins, vec3_t maxs)
{
    const model_t* model = R_GetModelByHandle(handle);
    if (MOD_BRUSH == model->type) {
        VectorCopy(model->bmodel->bounds[0], mins);
        VectorCopy(model->bmodel->bounds[1], maxs);
    } else if (MOD_MESH == model->type) {
        mdvModel_t* header;
        mdvFrame_t* frame;

        header = model->mdv[0];
        frame = header->frames;

        VectorCopy(frame->bounds[0], mins);
        VectorCopy(frame->bounds[1], maxs);
    }
}
