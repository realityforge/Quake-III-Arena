textures/base_wall/bluemetal2_noisy
{
  qer_editorimage textures/base_wall/bluemetal2_shiny
  surfaceparm metalsteps
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_wall/bluemetal2_shiny
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
