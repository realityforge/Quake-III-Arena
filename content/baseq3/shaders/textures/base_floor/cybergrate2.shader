textures/base_floor/cybergrate2
{
  cull disable
  surfaceparm alphashadow
  surfaceparm metalsteps
  surfaceparm nomarks
  {
    map textures/base_floor/cybergrate2
    depthWrite
    alphaFunc GE128
    rgbGen vertex
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
