textures/base_wall/bluemetalsupport2eye
{
  q3map_surfacelight 300
  q3map_lightimage textures/base_wall/bluemetalsupport2eyel
  surfaceparm nomarks
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_wall/bluemetalsupport2eye
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall/bluemetalsupport2eyel
    blendFunc add
    rgbGen wave triangle .5 .5 0 .5
  }
}
