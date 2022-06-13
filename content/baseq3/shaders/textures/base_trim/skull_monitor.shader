textures/base_trim/skull_monitor
{
  {
    map textures/base_trim/skull_monitor
    rgbGen identity
    tcmod turb 0 .05 0 .2
  }
  {
    map textures/sfx/text
    blendFunc add
    rgbGen identity
    tcmod scroll 1 0
  }
  {
    map textures/effects/tinfx2
    blendFunc add
    tcGen environment
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
