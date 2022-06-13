textures/proto2/tin_panel
{
  surfaceparm metalsteps
  {
    map textures/effects/tinfx
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen identity
  }
  {
    map textures/proto2/tin_panel
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
