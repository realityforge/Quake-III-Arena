models/mapobjects/banner/q3banner04
{
  cull disable
  nomipmaps
  {
    map textures/sfx/firegorre2
    blendFunc GL_ONE GL_ZERO
    tcmod scale .05 .1
    tcmod turb 0 .25 0 .6
    tcmod scroll .4 .3
  }
  {
    map textures/sfx/bolts
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
    tcmod scale .2 .2
    tcmod rotate 999
    tcmod scroll 9 9
  }
  {
    map textures/sfx/firegorre2
    blendFunc add
    tcGen environment
    tcmod scale 5 5
    tcmod scroll .09 .04
  }
}
