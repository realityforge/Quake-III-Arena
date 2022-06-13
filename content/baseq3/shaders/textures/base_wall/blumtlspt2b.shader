textures/base_wall/blumtlspt2b
{
  q3map_surfacelight 100
  q3map_lightimage textures/base_wall/blumtlspt2bglow
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_wall/blumtlspt2b
    blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall/bluemetalsupport2bglow
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
