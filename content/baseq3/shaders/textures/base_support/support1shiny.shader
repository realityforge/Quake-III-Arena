textures/base_support/support1shiny
{
  {
    map textures/effects/tinfx
    tcGen environment
    rgbGen identity
  }
  {
    map textures/base_support/support1shiny
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
