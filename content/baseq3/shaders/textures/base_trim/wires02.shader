textures/base_trim/wires02
{
  cull disable
  surfaceparm alphashadow
  surfaceparm trans
  {
    map textures/base_trim/wires02
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
