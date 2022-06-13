textures/eerie/teslacoil
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/cabletest2
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/electricgrade3
    blendFunc add
    rgbGen wave sin .25 .25 .25 .25
    tcmod turb .2 .2 .1 1
    tcmod scale .25 .25
    tcmod scroll -0.5 -1.2
  }
  {
    map textures/eerie/electricslime
    blendFunc GL_DST_COLOR GL_ONE
    tcmod turb .2 .2 .1 1
    tcmod scale .25 .25
    tcmod scroll .5 1.5
  }
}
