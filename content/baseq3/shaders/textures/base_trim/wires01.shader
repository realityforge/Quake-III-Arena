textures/base_trim/wires01
{
  cull disable
  surfaceparm alphashadow
  surfaceparm trans
  deformVertexes autoSprite2
  {
    map textures/base_trim/wires01
    depthWrite
    alphaFunc GE128
    rgbGen vertex
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
