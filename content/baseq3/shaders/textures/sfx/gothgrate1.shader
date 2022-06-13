textures/sfx/gothgrate1
{
  cull disable
  surfaceparm metalsteps
  {
    map textures/sfx/gothgrate1
    depthWrite
    alphaFunc GE128
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
