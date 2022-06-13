textures/base_support/shinysupport1
{
  {
    map $lightmap
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_support/shinysupport1
    blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
