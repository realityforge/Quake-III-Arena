textures/proto2/rail01
{
  cull disable
  surfaceparm alphashadow
  surfaceparm trans
  {
    map textures/proto2/rail01
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
