textures/proto2/door_right
{
  surfaceparm metalsteps
  {
    map textures/effects2/envmap_sky
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen identity
  }
  {
    map textures/proto2/door_right
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
