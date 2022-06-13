textures/liquids2/clear_calm1v
{
  q3map_globaltexture
  qer_editorimage textures/liquids/pool3d_3e
  qer_trans .5
  cull disable
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  deformVertexes wave 64 sin .25 .25 0 .5
  {
    map textures/liquids/pool3d_5e
    blendFunc GL_DST_COLOR GL_ONE
    rgbGen identity
    tcmod scale .5 .5
    tcmod scroll .025 .01
  }
  {
    map textures/liquids/pool3d_3e
    blendFunc GL_DST_COLOR GL_ONE
    rgbGen vertex
    tcmod scale -0.5 -0.5
    tcmod scroll .025 .025
  }
}
