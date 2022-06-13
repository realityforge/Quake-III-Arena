textures/natestah/nateswater
{
  q3map_globaltexture
  qer_editorimage textures/natestah/nateswater
  qer_trans .5
  cull disable
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  deformVertexes wave 64 sin .25 .25 0 .5
  {
    map textures/natestah/nateswater
    blendFunc add
    rgbGen identity
    tcmod scale .5 .5
    tcmod scroll .025 .01
  }
  {
    map textures/liquids/pool3d_3e
    blendFunc GL_DST_COLOR GL_ONE
    tcmod scale -0.5 -0.5
    tcmod scroll .025 .025
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
