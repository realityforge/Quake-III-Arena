textures/liquids/bloodwater
{
  q3map_surfacelight 200
  q3map_globaltexture
  tesssize 64
  qer_trans .5
  cull disable
  surfaceparm nolightmap
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  deformVertexes wave 100 sin 1 1 .5 .5
  {
    map textures/liquids/bloodwater1
    blendFunc add
    tcGen environment
    tcmod scroll 0 .01
  }
  {
    map textures/liquids/bloodwater2
    blendFunc GL_DST_COLOR GL_SRC_COLOR
    tcmod scale .1 .1
    tcmod turb .1 .1 1 .01
    tcmod scroll 0 .01
  }
  {
    map textures/liquids/bloodwater
    blendFunc GL_DST_COLOR GL_SRC_COLOR
    tcmod scale .25 .25
    tcmod scroll 0 .007
  }
}
