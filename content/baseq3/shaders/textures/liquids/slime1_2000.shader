textures/liquids/slime1_2000
{
  q3map_surfacelight 2000
  q3map_lightimage textures/liquids/slime7
  q3map_globaltexture
  tesssize 32
  qer_editorimage textures/liquids/slime7
  qer_trans .5
  cull disable
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm slime
  surfaceparm trans
  deformVertexes wave 100 sin 0 1 .5 .5
  {
    map textures/liquids/slime7c
    tcmod turb .3 .2 1 .05
    tcmod scroll .01 .01
  }
  {
    map textures/liquids/slime7
    blendFunc add
    tcmod turb .2 .1 1 .05
    tcmod scale .5 .5
    tcmod scroll .01 .01
  }
  {
    map textures/liquids/bubbles
    blendFunc GL_ZERO GL_SRC_COLOR
    tcmod turb .2 .1 .1 .2
    tcmod scale .05 .05
    tcmod scroll .001 .001
  }
}
