textures/proto2/grate_trim
{
  surfaceparm metalsteps
  {
    map textures/sfx/specular
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen identity
  }
  {
    map textures/proto2/grate_trim
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
