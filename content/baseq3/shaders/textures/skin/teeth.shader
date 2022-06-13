textures/skin/teeth
{
  {
    map textures/skin/teeth
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
  {
    map textures/sfx/specular4
    blendFunc add
    tcGen environment
    rgbGen identity
  }
}
