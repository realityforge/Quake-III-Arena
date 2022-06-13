textures/gothic_trim/metalsupport4h_trans
{
  qer_editorimage textures/gothic_trim/metalsupport4h_shiny
  surfaceparm nonsolid
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_trim/metalsupport4h_shiny
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
