textures/proto2/marble02b_s
{
  surfaceparm metalsteps
  {
    map textures/effects/tinfx2
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen identity
  }
  {
    map textures/proto2/marble02b_s
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
