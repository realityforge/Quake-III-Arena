textures/ctf/tallblue_4c_fin_shiny
{
  qer_editorimage textures/ctf/tallblue_4c_fin
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/ctf/tallblue_4c_fin
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
