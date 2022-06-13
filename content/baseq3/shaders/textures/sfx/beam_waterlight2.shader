textures/sfx/beam_waterlight2
{
  q3map_surfacelight 50
  q3map_globaltexture
  qer_editorimage textures/sfx/beam_waterlight
  qer_trans .6
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm nonsolid
  surfaceparm trans
  {
    map textures/sfx/beam_waterlight
    blendFunc add
    tcmod turb 0 .015 .5 .07
    tcmod scroll .15 0
  }
}
