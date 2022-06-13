textures/sfx/beam_dusty
{
  qer_editorimage textures/sfx/beam_3
  qer_trans .3
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm nonsolid
  surfaceparm trans
  {
    map textures/sfx/beam_3
    blendFunc add
    tcmod turb 0 .015 .5 .07
    tcmod scroll .15 0
  }
}
