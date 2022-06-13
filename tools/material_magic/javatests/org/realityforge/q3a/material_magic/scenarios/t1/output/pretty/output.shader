models/mapobjects/bat/bat
{
  cull disable
  deformVertexes wave 10 sin 0 3 0 3
  deformVertexes move 500 0 0 sawtooth 0 5 0 .1
  deformVertexes move 0 0 7 sin 0 5 0 .5
}

textures/base/moveypipe
{
  tesssize 128
  deformVertexes bulge 3 10 1
}

textures/base/my_base
{
  q3map_sun 1 1 1 100 -58 58
  q3map_surfacelight 1500
  q3map_lightsubdivide 22
  q3map_lightimage textures/wall/glowglow
  q3map_globaltexture
  q3map_novertexshadows
  q3map_forcesunlight
  q3map_flare flareshader
  q3map_backsplash 100 8
  qer_editorimage textures/sfx/xyz
  qer_nocarve
  qer_trans .3
  cull disable
  nopicmip
  nomipmaps
  portal
  entityMergable
  polygonOffset
  fogparms .85 .1 .01 980
  surfaceparm nomarks
  surfaceparm trans
}

textures/base/my_base2
{
  q3map_sun .5 .37 .19 80 315 70
  q3map_forcesunlight
  q3map_flare whoosh
  tesssize 32
  cull back
  nopicmip
  nomipmaps
  portal
  entityMergable
  fogparms .85 .1 .01 980
  skyparms env/wildspace1 - -
  sort sky
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
}

textures/base/my_base6
{
  deformVertexes wave 100 sin 3 2 .1 3
  deformVertexes normal .5 .1
}

textures/base/my_base7
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes autoSprite2
}

textures/base/my_base8
{
  q3map_surfacelight 500
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes autoSprite
}

textures/base/my_base_3
{
  cull disable
  fogparms .7 .7 .7 128
  skyparms - 512 -
  sort 2.3
}

textures/base/my_base_4
{
  cull back
}

textures/base/my_base_5
{
  cull back
  polygonOffset
  sort 2
}

textures/base/projectionShadow
{
  polygonOffset
  deformVertexes projectionShadow
}

textures/base/waveywater
{
  deformVertexes wave 100 triangle 2 2 1 .1
}
