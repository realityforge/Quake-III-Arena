textures/base_wall/bluemetalsupport2clight
{
  q3map_surfacelight 500
  surfaceparm nomarks
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_wall/bluemetalsupport2clight
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall/bluemetalsupport2clight_glow
    blendFunc add
    rgbGen wave sawtooth .6 .1 0 4
  }
}
