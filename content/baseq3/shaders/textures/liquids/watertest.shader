textures/liquids/watertest
{
  q3map_globaltexture
  tesssize 32
  qer_editorimage textures/liquids/pool3d_3b
  qer_trans .5
  cull disable
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  deformVertexes normal .1 .5
  {
    map textures/liquids/pool3d_3f
    blendFunc add
    tcGen environment
    rgbGen wave sin .25 0 0 0
    tcmod scale 2 1
    tcmod scroll .05 .05
  }
}
