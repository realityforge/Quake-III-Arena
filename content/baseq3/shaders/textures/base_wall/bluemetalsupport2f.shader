textures/base_wall/bluemetalsupport2f
{
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_wall/bluemetalsupport2f
    blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
