textures/eerie/iron01_e_flicker
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/iron01_e_flicker
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/firewalla
    blendFunc filter
    tcmod scale .25 .25
    tcmod turb .2 .2 .1 1
    tcmod scroll -15 -5
  }
  {
    map textures/eerie/firewallb
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    tcmod scale .1 .1
    tcmod turb .2 .1 .1 1
    tcmod scroll -10 0
  }
}
