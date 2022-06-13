textures/liquids/calm_poollight2
{
  q3map_surfacelight 50
  q3map_globaltexture
  tesssize 512
  qer_editorimage textures/liquids/pool3d_4b
  qer_trans .75
  cull disable
  surfaceparm nolightmap
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  deformVertexes wave 100 sin 1 1 1 .1
  {
    map textures/liquids/pool3d_5c2
    blendFunc filter
    rgbGen identity
    tcmod scale .5 .5
    tcmod transform 1.5 0 1.5 1 1 2
    tcmod scroll -0.05 .001
  }
  {
    map textures/liquids/pool3d_6c2
    blendFunc filter
    rgbGen identity
    tcmod scale .5 .5
    tcmod transform 0 1.5 1 1.5 2 1
    tcmod scroll .025 -0.001
  }
  {
    map textures/liquids/pool3d_3c2
    blendFunc filter
    rgbGen identity
    tcmod scale .25 .5
    tcmod scroll .001 .025
  }
  {
    map textures/liquids/pool3d_4b2
    blendFunc add
    rgbGen identity
    tcmod scale .125 .125
  }
}
