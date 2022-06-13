textures/gothic_door/door02_bred2_shiny
{
  qer_editorimage textures/gothic_door/door02_bred2
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_door/door02_bred2
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
