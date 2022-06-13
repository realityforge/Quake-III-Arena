textures/liquids/xctf_painwater
{
  q3map_surfacelight 450
  q3map_globaltexture
  tesssize 64
  qer_editorimage textures/liquids/pool2
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
    map textures/liquids/pool3
    blendFunc GL_DST_COLOR GL_ONE
    tcmod turb .1 .1 0 .01
    tcmod scale .5 .5
    tcmod scroll -0.025 .02
  }
  {
    map textures/sfx/bolts
    blendFunc add
    tcmod scale .2 .2
    tcmod scroll .1 .1
    tcmod rotate 290
  }
}
