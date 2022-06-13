textures/base_trim/pewter_shiney
{
  {
    map textures/effects/tinfx
    tcGen environment
    rgbGen identity
  }
  {
    map textures/base_trim/pewter_shiney
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
