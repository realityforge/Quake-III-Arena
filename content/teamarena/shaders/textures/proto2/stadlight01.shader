textures/proto2/stadlight01
{
  cull disable
  surfaceparm alphashadow
  surfaceparm nomarks
  {
    map textures/proto2/stadlight01
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
  {
    map textures/proto2/stadlight01fx
    blendFunc add
    rgbGen wave sin .5 .5 0 2
  }
}
