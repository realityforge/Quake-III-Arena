textures/base_floor/skylight_spec
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_floor/skylight_spec
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
