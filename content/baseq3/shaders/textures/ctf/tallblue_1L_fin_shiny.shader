textures/ctf/tallblue_1L_fin_shiny
{
  qer_editorimage textures/ctf/tallblue_1L_fin
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/ctf/tallblue_1R_fin
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
