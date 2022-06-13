textures/base_wall/grill2
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_wall/grill2
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
  {
    map textures/effects/tinfx
    blendFunc add
    tcGen environment
    rgbGen identity
  }
  {
    map textures/base_wall/grill2
    blendFunc filter
    rgbGen identity
  }
}
