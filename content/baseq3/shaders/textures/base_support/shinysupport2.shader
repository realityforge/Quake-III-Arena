textures/base_support/shinysupport2
{
  {
    map textures/base_wall/chrome_env
    rgbGen identity
  }
  {
    map textures/base_support/shinysupport2
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
