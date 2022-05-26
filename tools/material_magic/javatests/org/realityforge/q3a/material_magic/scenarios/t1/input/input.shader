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
}




  textures/base/myBase2
{
    q3map_forcesunlight
            // This is a non-normalized form of "cull back"
            cull backsided
q3map_flare whoosh
}

textures/base/myBase_4 { /* This is a non-normalized form of "cull back" */ cull backsided }


textures/base/myBase_3
{
// This is a non-normalized form of "cull disable"
cull none
}
