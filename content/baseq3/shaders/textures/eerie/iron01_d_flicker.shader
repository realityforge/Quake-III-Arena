textures/eerie/iron01_d_flicker
{
  tesssize 32
  surfaceparm nolightmap
  {
    map textures/eerie/iron01_d_flicker
  }
  {
    map textures/eerie/firewalla
    blendFunc filter
    tcmod scroll 5 15
    tcmod scale .25 .25
    tcmod turb .2 .2 .1 1
  }
  {
    map textures/eerie/firewallb
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    tcmod scale .1 .1
    tcmod turb .2 .1 .1 1
    tcmod scroll 0 10
  }
}
