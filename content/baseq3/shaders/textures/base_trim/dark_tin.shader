textures/base_trim/dark_tin
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_trim/dark_tin
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
    map textures/base_trim/dark_tin
    blendFunc filter
    rgbGen identity
  }
}
