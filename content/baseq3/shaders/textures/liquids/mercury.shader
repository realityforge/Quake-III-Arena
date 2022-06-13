textures/liquids/mercury
{
  tesssize 128
  deformVertexes wave 100 sin 5 5 0 .4
  {
    map $lightmap
    blendFunc add
    rgbGen identity
  }
  {
    map textures/liquids/mercury
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
  {
    map textures/base_trim/tinfx
    blendFunc add
    tcGen environment
    rgbGen identity
  }
  {
    map textures/liquids/mercury
    blendFunc filter
    rgbGen identity
  }
}
