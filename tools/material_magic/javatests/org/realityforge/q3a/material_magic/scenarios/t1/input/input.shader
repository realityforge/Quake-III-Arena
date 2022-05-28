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

// Duplicate surfaceparm are ignored
surfaceparm nomarks
surfaceparm nomarks
surfaceparm nomarks
surfaceparm nomarks
}




  textures/base/myBase2
{
surfaceparm noimpact
surfaceparm nolightmap
surfaceparm sky
q3map_SUN .5 .37 .19 80 315 70
    q3map_forcesunlight
            // This is a non-normalized form of "cull back"
            cull backside
q3map_flare whoosh
tesssize 32
}

textures/base/myBase_4 { /* This is a non-normalized form of "cull back" */ cull backsided }

textures/base/myBase_5 { /* This is a non-normalized form of "cull back" with mixed case */ cull backSided }


textures/base/myBase_3
{
// This is a non-normalized form of "cull disable"
cull none
}
