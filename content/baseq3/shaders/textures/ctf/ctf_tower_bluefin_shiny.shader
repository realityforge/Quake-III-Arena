textures/ctf/ctf_tower_bluefin_shiny
{
  qer_editorimage textures/ctf/ctf_tower_bluefin
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/ctf/ctf_tower_bluefin
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
