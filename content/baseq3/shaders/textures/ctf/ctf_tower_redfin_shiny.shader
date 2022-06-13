textures/ctf/ctf_tower_redfin_shiny
{
  qer_editorimage textures/ctf/ctf_tower_redfin
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/ctf/ctf_tower_redfin
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
