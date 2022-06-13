textures/eerie/firewall
{
  q3map_surfacelight 6000
  tesssize 64
  surfaceparm nolightmap
  surfaceparm nonsolid
  {
    map textures/eerie/firewalla
    blendFunc GL_ONE GL_ZERO
    tcmod scale .25 .25
    tcmod turb .2 .2 .1 1
    tcmod scroll 5 15
  }
  {
    map textures/eerie/firewallb
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    tcmod scale .1 .1
    tcmod turb .2 .1 .1 1
    tcmod scroll 0 10
  }
  {
    map textures/eerie/firewall
    blendFunc GL_DST_COLOR GL_ONE
    tcmod turb .1 .1 .5 .5
    tcmod scroll 10 40
  }
}
