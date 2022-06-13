textures/proto2/wheel01
{
  cull disable
  surfaceparm alphashadow
  surfaceparm nomarks
  {
    map textures/proto2/wheel01
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
