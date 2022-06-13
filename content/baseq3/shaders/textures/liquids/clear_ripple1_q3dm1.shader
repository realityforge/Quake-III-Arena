textures/liquids/clear_ripple1_q3dm1
{
  q3map_globaltexture
  qer_editorimage textures/liquids/pool3d_3
  qer_trans .5
  cull disable
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  deformVertexes wave 64 sin .5 .5 0 .5
  {
    map textures/liquids/pool3d_5
    blendFunc GL_DST_COLOR GL_ONE
    rgbGen identity
    tcmod scale .5 .5
    tcmod transform 1.5 0 1.5 1 1 2
    tcmod scroll -0.05 .001
  }
  {
    map textures/liquids/pool3d_6
    blendFunc GL_DST_COLOR GL_ONE
    rgbGen identity
    tcmod scale .5 .5
    tcmod transform 0 1.5 1 1.5 2 1
    tcmod scroll .025 -0.001
  }
  {
    map textures/liquids/pool3d_3
    blendFunc GL_DST_COLOR GL_ONE
    rgbGen identity
    tcmod scale .25 .5
    tcmod scroll .001 .025
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
