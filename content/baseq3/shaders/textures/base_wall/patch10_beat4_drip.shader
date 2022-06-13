textures/base_wall/patch10_beat4_drip
{
  qer_editorimage textures/base_wall/patch10_beatup4_stain
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_wall/waterdrip
    blendFunc GL_ONE GL_SRC_ALPHA
    tcmod scroll 0 -0.001
  }
  {
    map textures/base_wall/patch10_beatup4_stain
    blendFunc GL_ONE GL_SRC_ALPHA
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
