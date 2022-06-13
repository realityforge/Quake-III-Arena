textures/proto2/girder05
{
  cull disable
  surfaceparm alphashadow
  surfaceparm trans
  {
    map textures/proto2/girder05
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
