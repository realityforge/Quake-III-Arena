textures/sfx/teslacoil2
{
  qer_editorimage textures/sfx/tesla1
  cull disable
  deformVertexes wave 100 triangle 0 5 1 1
  {
    map textures/sfx/lightningcoil
    blendFunc add
    rgbGen wave sin .5 0 0 0
    tcmod scroll 5 5
  }
}
