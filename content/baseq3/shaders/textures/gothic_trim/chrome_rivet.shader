textures/gothic_trim/chrome_rivet
{
  {
    map textures/effects/tinfx
    tcGen environment
    rgbGen identity
  }
  {
    map textures/gothic_trim/chrome_rivet
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
