textures/proto2/chain
{
  cull disable
  deformVertexes autoSprite2
  deformVertexes wave 100 sin 0 3 0 .05
  deformVertexes wave 100 sin 0 3 0 .3
  {
    map textures/proto2/chain
    depthWrite
    alphaFunc GE128
    rgbGen identity
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
