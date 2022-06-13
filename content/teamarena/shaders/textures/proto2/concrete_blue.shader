textures/proto2/concrete_blue
{
  surfaceparm metalsteps
  {
    map textures/effects2/bluefx
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen identity
  }
  {
    map textures/proto2/concrete_blue
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
