textures/sfx/flameanim_red_nolight
{
  q3map_lightimage textures/sfx/r_flame3
  qer_editorimage textures/sfx/r_flame3
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  {
    animMap 10 textures/sfx/r_flame1 textures/sfx/r_flame2 textures/sfx/r_flame3 textures/sfx/r_flame4 textures/sfx/r_flame5 textures/sfx/r_flame6 textures/sfx/r_flame7 textures/sfx/r_flame8
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 10
  }
  {
    animMap 10 textures/sfx/r_flame2 textures/sfx/r_flame3 textures/sfx/r_flame4 textures/sfx/r_flame5 textures/sfx/r_flame6 textures/sfx/r_flame7 textures/sfx/r_flame8 textures/sfx/r_flame1
    blendFunc add
    rgbGen wave sawtooth 0 1 0 10
  }
  {
    map textures/sfx/r_flameball
    blendFunc add
    rgbGen wave sin .6 .2 0 .6
  }
}
