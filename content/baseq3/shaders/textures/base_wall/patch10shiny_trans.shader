textures/base_wall/patch10shiny_trans
{
  qer_editorimage textures/base_wall/patch10_beatup4_alpha
  surfaceparm nonsolid
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_wall/patch10_beatup4_alpha
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
