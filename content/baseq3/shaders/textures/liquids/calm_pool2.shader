textures/liquids/calm_pool2
{
  q3map_globaltexture
  tesssize 64
  qer_editorimage textures/liquids/pool3
  qer_trans .5
  cull disable
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
    map textures/liquids/pool3
    blendFunc GL_DST_COLOR GL_ONE
    tcmod scale .5 .5
    tcmod scroll -0.025 .02
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE
    tcmod turb 0 .001 0 1
  }
  {
    map textures/liquids/pj_e3_reflection
    blendFunc GL_DST_COLOR GL_ONE
    tcGen environment
  }
}
