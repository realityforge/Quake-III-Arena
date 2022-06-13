textures/base_floor/pjgrate1
{
  cull disable
  surfaceparm metalsteps
  {
    map textures/base_floor/pjgrate1
    depthWrite
    alphaFunc GE128
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scale 2 2
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
