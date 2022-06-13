textures/proto2/x_smallpipe
{
  cull disable
  surfaceparm alphashadow
  surfaceparm trans
  deformVertexes autoSprite2
  {
    map textures/proto2/x_smallpipe
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
