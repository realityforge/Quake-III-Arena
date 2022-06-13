textures/liquids/xripplewater2
{
  q3map_surfacelight 600
  q3map_globaltexture
  tesssize 64
  qer_editorimage textures/liquids/ripplewater2
  qer_trans .5
  fogparms ( .3 .3 1 ) 512
  surfaceparm fog
  surfaceparm nolightmap
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  deformVertexes wave 100 triangle 2 2 1 .1
  {
    map textures/liquids/ripplewater3
    blendFunc GL_ONE GL_SRC_COLOR
    tcGen environment
    tcmod scale .05 .05
    tcmod scroll .001 .001
  }
  {
    map textures/liquids/ripplewater2
    blendFunc GL_DST_COLOR GL_ONE
    tcmod turb .1 .1 0 .01
    tcmod scale .5 .5
    tcmod scroll -0.025 .02
  }
  {
    map textures/liquids/ripplewater
    blendFunc GL_DST_COLOR GL_ONE
    tcmod turb .1 .07 .1 .01
    tcmod scale .5 .5
    tcmod stretch sin 1 .1 0 .01
    tcmod scroll 0 .025
  }
}
