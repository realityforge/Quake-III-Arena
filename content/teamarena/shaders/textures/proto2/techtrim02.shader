textures/proto2/techtrim02
{
  surfaceparm metalsteps
  {
    map textures/sfx/specular
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen identity
  }
  {
    map textures/proto2/techtrim02
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
