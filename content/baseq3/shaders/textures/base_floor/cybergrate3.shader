textures/base_floor/cybergrate3
{
  cull disable
  surfaceparm alphashadow
  surfaceparm metalsteps
  surfaceparm nomarks
  {
    map textures/sfx/hologirl
    blendFunc add
    tcmod scale 1.2 .5
    tcmod scroll 3.1 1.1
  }
  {
    map textures/base_floor/cybergrate3
    depthWrite
    alphaFunc GE128
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
