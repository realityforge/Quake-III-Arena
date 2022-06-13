textures/proto2/marbledoor_red
{
  surfaceparm metalsteps
  {
    map textures/effects/tinfx2
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen identity
  }
  {
    map textures/proto2/marbledoor_red
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
