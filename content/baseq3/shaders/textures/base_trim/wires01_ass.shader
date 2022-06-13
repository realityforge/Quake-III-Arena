textures/base_trim/wires01_ass
{
  cull disable
  surfaceparm alphashadow
  deformVertexes autoSprite2
  {
    map textures/base_trim/wires01_ass
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
