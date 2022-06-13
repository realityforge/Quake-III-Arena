textures/proto2/gothic_light
{
  cull disable
  surfaceparm alphashadow
  surfaceparm nomarks
  {
    map textures/proto2/gothic_light
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
