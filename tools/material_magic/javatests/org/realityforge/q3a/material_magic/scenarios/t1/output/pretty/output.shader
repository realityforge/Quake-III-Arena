models/mapobjects/bat/bat
{
  cull disable
  deformVertexes wave 10.0 sin 0.0 3.0 0.0 3.0
  deformVertexes move 500.0 0.0 0.0 sawtooth 0.0 5.0 0.0 0.1
  deformVertexes move 0.0 0.0 7.0 sin 0.0 5.0 0.0 0.5
}

textures/base/moveypipe
{
  tesssize 128
  deformVertexes bulge 3.0 10.0 1.0
}

textures/base/myBase
{
  q3map_sun 1.0 1.0 1.0 100 -58 58
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
  qer_trans 0.3
  cull disable
  nopicmip
  nomipmaps
  portal
  entityMergable
  polygonOffset
  fogparms 0.85 0.1 0.01 980
  surfaceparm nomarks
  surfaceparm trans
}

textures/base/myBase2
{
  q3map_sun 0.5 0.37 0.19 80 315 70
  q3map_forcesunlight
  q3map_flare whoosh
  tesssize 32
  cull back
  nopicmip
  nomipmaps
  portal
  entityMergable
  fogparms 0.85 0.1 0.01 980
  skyparms env/wildspace1 - -
  sort sky
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
}

textures/base/myBase6
{
  deformVertexes wave 100.0 sin 3.0 2.0 0.1 3.0
  deformVertexes normal 0.5 0.1
}

textures/base/myBase7
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes autoSprite2
}

textures/base/myBase8
{
  q3map_surfacelight 500
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes autoSprite
}

textures/base/myBase_3
{
  cull disable
  fogparms 0.7 0.7 0.7 128
  skyparms - 512 -
  sort 2.3
}

textures/base/myBase_4
{
  cull back
}

textures/base/myBase_5
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
  deformVertexes wave 100.0 triangle 2.0 2.0 1.0 0.1
}
