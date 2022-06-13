textures/base_trim/dark_tin2
{
  {
    map textures/effects/tinfx
    tcGen environment
    rgbGen vertex
  }
  {
    map textures/base_trim/dark_tin2
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
