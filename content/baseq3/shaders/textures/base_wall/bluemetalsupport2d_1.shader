textures/base_wall/bluemetalsupport2d_1
{
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_wall/bluemetalsupport2d_1
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
