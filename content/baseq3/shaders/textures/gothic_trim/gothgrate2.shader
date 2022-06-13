textures/gothic_trim/gothgrate2
{
  cull disable
  surfaceparm metalsteps
  {
    map textures/gothic_trim/gothgrate2
    depthWrite
    alphaFunc GT0
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
