textures/proto2/pipes01
{
  cull disable
  surfaceparm alphashadow
  {
    map textures/proto2/pipes01
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
