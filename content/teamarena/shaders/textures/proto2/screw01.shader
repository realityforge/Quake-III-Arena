textures/proto2/screw01
{
  surfaceparm alphashadow
  surfaceparm metalsteps
  surfaceparm nomarks
  {
    map textures/proto2/screw01
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
