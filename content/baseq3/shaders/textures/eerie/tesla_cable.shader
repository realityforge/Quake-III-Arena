textures/eerie/tesla_cable
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/tesla_cable
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/electricslime
    blendFunc GL_DST_COLOR GL_ONE
    tcmod turb .2 .2 1 .1
    tcmod scroll 0 15
    tcmod scale .1 .1
  }
}
