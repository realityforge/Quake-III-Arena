textures/hell/xfiretest1
{
  q3map_surfacelight 1000
  tesssize 64
  qer_editorimage textures/hell/firetestb
  surfaceparm noimpact
  surfaceparm nolightmap
  {
    map textures/hell/firetestb
    blendFunc GL_ONE GL_ZERO
    tcmod turb .2 .2 .1 1
    tcmod scale .25 .25
    tcmod scroll .5 1.5
  }
  {
    map textures/hell/firetest
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    tcmod turb .2 .1 .1 1
    tcmod scale .1 .1
    tcmod scroll 0 1
  }
  {
    map textures/hell/firetest2
    blendFunc GL_DST_COLOR GL_ONE
    tcmod turb .1 .1 .5 .5
    tcmod scroll 1 5
  }
}