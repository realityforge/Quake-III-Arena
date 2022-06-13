textures/base_wall/blupaintedmetal
{
  {
    map $lightmap
    tcGen environment
    tcmod scale .25 .25
  }
  {
    map textures/base_wall/blupaintedmetal
    blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
