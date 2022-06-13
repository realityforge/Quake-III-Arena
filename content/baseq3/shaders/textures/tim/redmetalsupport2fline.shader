textures/tim/redmetalsupport2fline
{
  q3map_surfacelight 100
  q3map_lightimage textures/tim/redmetalsupport2fline_glow
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/tim/redmetalsupport2fline
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/tim/redmetalsupport2fline_glow
    blendFunc add
    rgbGen wave sin .5 .5 0 1
  }
}
