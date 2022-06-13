textures/base_door/shinymetaldoor_outside3b
{
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_door/shinymetaldoor_outside3b
    blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
