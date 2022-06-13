textures/base_wall/shinymetal2
{
  {
    map $lightmap
    tcGen environment
    tcmod scale .25 .25
  }
  {
    map $lightmap
    blendFunc GL_ONE GL_SRC_COLOR
    rgbGen identity
  }
  {
    map textures/base_wall/shinymetal2
    blendFunc filter
    rgbGen identity
  }
}
