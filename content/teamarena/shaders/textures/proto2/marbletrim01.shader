textures/proto2/marbletrim01
{
  cull disable
  surfaceparm alphashadow
  {
    map textures/proto2/marbletrim01
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