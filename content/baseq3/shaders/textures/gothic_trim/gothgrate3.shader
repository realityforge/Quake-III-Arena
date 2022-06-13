textures/gothic_trim/gothgrate3
{
  cull disable
  surfaceparm metalsteps
  {
    map textures/gothic_trim/gothgrate3
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
