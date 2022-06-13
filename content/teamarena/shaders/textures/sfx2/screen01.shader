textures/sfx2/screen01
{
  cull disable
  surfaceparm nomarks
  {
    map textures/sfx2/screen01
    rgbGen identity
    tcmod scroll 9 .1
  }
  {
    map textures/effects2/tinfx_scr
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
