textures/proto2/girder03
{
  cull disable
  nopicmip
  surfaceparm alphashadow
  surfaceparm trans
  {
    map textures/proto2/girder03
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
