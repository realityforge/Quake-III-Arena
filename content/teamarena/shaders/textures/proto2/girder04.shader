textures/proto2/girder04
{
  cull disable
  surfaceparm alphashadow
  surfaceparm trans
  {
    map textures/proto2/girder04
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
