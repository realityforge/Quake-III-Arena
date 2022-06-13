textures/base_floor/hfloor3
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_floor/hfloor3
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
    map textures/base_floor/hfloor3
    blendFunc filter
    rgbGen identity
  }
}
