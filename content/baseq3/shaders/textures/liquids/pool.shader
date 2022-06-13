textures/liquids/pool
{
  q3map_globaltexture
  tesssize 64
  qer_trans .5
  cull disable
  surfaceparm nolightmap
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  deformVertexes wave 100 sin 1 1 1 .1
  {
    map textures/liquids/pool2
    blendFunc GL_ONE GL_SRC_COLOR
    tcmod scale .03 .03
    tcmod scroll .001 .001
  }
  {
    map textures/liquids/pool
    blendFunc GL_DST_COLOR GL_ONE
    rgbGen wave sin .5 .5 0 .05
    tcmod scale .2 .2
    tcmod stretch sin 1 .1 0 .05
    tcmod scroll -0.001 .001
  }
  {
    map textures/liquids/pool3
    blendFunc GL_DST_COLOR GL_ONE
    tcmod turb .1 .1 0 .01
    tcmod scale .5 .5
    tcmod scroll -0.025 .02
  }
  {
    map textures/liquids/pool4
    blendFunc GL_DST_COLOR GL_ONE
    rgbGen wave sin .5 .5 0 .07
    tcmod scale .3 .3
    tcmod turb .1 .01 0 .01
    tcmod stretch sin 1 .3 0 .015
    tcmod scroll .001 -0.001
  }
}
