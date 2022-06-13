textures/proto2/wirepipe
{
  cull disable
  surfaceparm alphashadow
  surfaceparm nomarks
  {
    map textures/proto2/wirepipe
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
