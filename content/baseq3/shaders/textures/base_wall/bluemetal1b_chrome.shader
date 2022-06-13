textures/base_wall/bluemetal1b_chrome
{
  qer_editorimage textures/base_wall/bluemetal1b
  {
    map textures/base_wall/chrome_env2
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_wall/bluemetal1b_shiny
    blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
