textures/base_wall/kcgrate1
{
  cull disable
  {
    map textures/base_wall/kcgrate1
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
