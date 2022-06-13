textures/base_wall/comp3c
{
  {
    map textures/base_wall/comp3env
    tcGen environment
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc add
    tcGen environment
  }
  {
    map textures/base_wall/comp3c
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
