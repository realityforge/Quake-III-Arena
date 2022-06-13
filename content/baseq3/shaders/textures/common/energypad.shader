textures/common/energypad
{
  qer_editorimage textures/common/bluegoal
  cull disable
  surfaceparm nolightmap
  {
    map textures/common/bluegoal
    blendFunc GL_ONE GL_SRC_ALPHA
    tcGen environment
    tcmod turb 0 .25 0 .05
  }
}
