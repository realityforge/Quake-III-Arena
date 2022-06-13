textures/base_door/shinymetaldoor_outside3a2
{
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_door/shinymetaldoor_outside3a2
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_door/shinymetaldoor_outside3glow
    blendFunc add
    rgbGen wave sin .9 .1 0 5
  }
}
