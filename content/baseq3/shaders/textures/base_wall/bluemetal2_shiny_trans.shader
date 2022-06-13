textures/base_wall/bluemetal2_shiny_trans
{
  qer_editorimage textures/base_wall/bluemetal2_shiny
  surfaceparm nonsolid
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
