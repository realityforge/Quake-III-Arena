textures/sfx/beam_water
{
  q3map_surfacelight 20
  qer_editorimage textures/sfx/beam_cyan4
  qer_trans .3
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm nonsolid
  surfaceparm trans
  {
    map textures/sfx/beam_cyan4
    blendFunc add
    tcmod turb 0 .025 .5 .03
    tcmod scroll .15 0
  }
  {
    map textures/sfx/beam_cyan5
    blendFunc add
    tcmod turb 0 .025 .5 .03
    tcmod scroll .15 .15
  }
}
