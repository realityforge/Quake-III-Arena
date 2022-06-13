textures/base_wall/bluemetalsupport2ftv
{
  q3map_surfacelight 100
  q3map_lightimage textures/base_wall/bluemetalsupport2ftv_glow
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_wall/bluemetalsupport2ftv
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall/bluemetalsupport2ftv_glow
    blendFunc add
    rgbGen wave sawtooth .4 .05 0 10
  }
}
