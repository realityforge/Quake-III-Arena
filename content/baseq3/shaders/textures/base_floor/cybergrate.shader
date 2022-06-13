textures/base_floor/cybergrate
{
  cull disable
  surfaceparm alphashadow
  surfaceparm metalsteps
  surfaceparm nomarks
  {
    map textures/base_floor/cybergrate
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
