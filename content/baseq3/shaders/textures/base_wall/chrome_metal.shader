textures/base_wall/chrome_metal
{
  {
    map textures/base_wall/chrome_env
    tcGen environment
    tcmod scale .25 .25
  }
  {
    map textures/base_wall/chrome_metal
    detail
    blendFunc add
    rgbGen identity
    tcmod scale .0693 .0712
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
