textures/proto2/red_zot
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes move .2 0 .3 sin 0 5 0 10
  deformVertexes move 0 .2 0 sin 0 5 0 13
  deformVertexes autoSprite2
  {
    map textures/proto2/red_zot
    blendFunc add
    rgbGen identity
  }
}
