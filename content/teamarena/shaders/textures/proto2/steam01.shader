textures/proto2/steam01
{
  qer_editorimage textures/proto2/steam_01_img
  cull disable
  surfaceparm pointlight
  surfaceparm trans
  deformVertexes autoSprite2
  deformVertexes wave 50 sin 0 3 0 .3
  deformVertexes move .3 .1 0 sin 0 .5 0 .2
  {
    map textures/proto2/steam01
    blendFunc blend
    rgbGen vertex
    tcmod scroll 0 .3
  }
}
