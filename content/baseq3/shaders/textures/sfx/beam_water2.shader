textures/sfx/beam_water2
{
  q3map_surfacelight 10
  qer_editorimage textures/sfx/beam_cyan5
  qer_trans .3
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm nonsolid
  surfaceparm trans
  {
    map textures/sfx/beam_cyan5
    blendFunc add
    tcmod turb 0 .045 .5 .03
    tcmod scroll .15 .015
  }
}
