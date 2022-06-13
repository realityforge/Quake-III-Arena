textures/proto2/concrete_red
{
  surfaceparm metalsteps
  {
    map textures/effects2/redfx
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen identity
  }
  {
    map textures/proto2/concrete_red
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
