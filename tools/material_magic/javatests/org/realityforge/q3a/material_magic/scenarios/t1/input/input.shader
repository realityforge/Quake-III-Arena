// some random comment
textures/base/myBase
{
qer_editorimage textures/sfx/xyz
qer_nocarve
/* This light property is actually the "old" form of q3map_flare and will be translated to "q3map_flare flareshader" */
        light 1
q3map_surfacelight 1500
q3map_lightimage textures/wall/glowglow
q3map_forcesunlight
qer_trans 0.30
// This is a non-normalized form of "cull disable"
cull twosided
q3map_novertexshadows
q3map_globaltexture
q3map_lightsubdivide 22
q3map_backsplash 100 8
q3map_sun	1 1 1 100 -58 58
// This next one has an UPPERCASE T but will be normalize to lower case
surfaceparm	Trans

entityMergable
portal

// Duplicate surfaceparm are ignored
surfaceparm nomarks
surfaceparm nomarks
surfaceparm nomarks
surfaceparm nomarks
nopicmip

        polygonOffset
nomipmaps
// This contains the "vertex" form
fogParms ( .85 .10 .01 ) 980
}




  textures/base/myBase2
{
// This contains the natural form sans vector
fogparms .85 .10 .01 980
surfaceparm noimpact
EntityMergAble
surfaceparm nolightmap
surfaceparm sky
q3map_SUN .5 .37 .19 80 315 70
    q3map_forcesunlight
            // This is a non-normalized form of "cull back"
            cull backside
q3map_flare whoosh
tesssize 32
noPicMip
noMipMaps
PoRtAl
// Increases separation between layers but no near/far box
skyParms env/wildspace1 - -

Sort sky
}

textures/base/myBase_4 { /* This is a non-normalized form of "cull back" */ cull backsided }

textures/base/myBase_5 {
/* This is a non-normalized form of "cull back" with mixed case */
cull backSided
// The provides just default so it weill be omitted
skyParms - - -
polygonoffset

// Numeric value that is integer-like so will have 0 dropped
sort 2.0
}


textures/base/myBase_3
{
// This is a non-normalized form of "cull disable"
cull none
// This contains the natural form with the numbers that were historically supported buyt now ignored
fogparms 0.7 0.7 0.7 128 64
// Increases separation between layers but no near/far box
skyparms - 512 -
// Numeric value that is float-like
sort 2.3
}

textures/base/myBase6
{
deformVertexes wave 100 sin 3 2 .1 3
deformVertexes normal .5 .1
}

textures/base/myBase7
{
deformVertexes autoSprite2
surfaceparm	trans
surfaceparm nomarks
surfaceparm nolightmap
cull none
}

textures/base/myBase8
{
deformVertexes autoSprite
q3map_surfacelight	500
surfaceparm	trans
surfaceparm nomarks
surfaceparm nolightmap
cull none
}

textures/base/projectionShadow
{
    polygonOffset
    deformVertexes projectionShadow
}

textures/base/moveypipe
{
tessSize 128
deformVertexes bulge 3 10 1
}

textures/base/waveywater
{
deformVertexes wave 100 triangle 2 2 1 0.1
}

models/mapobjects/bat/bat
{
deformVertexes wave 10 sin 0 3 0 3
deformVertexes move 500 0 0   sawtooth 0 5 0 .1

deformVertexes move 0 0 7  sin 0 5 0 .5
cull disable
}
