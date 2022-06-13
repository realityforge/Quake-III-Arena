textures/sfx/flameanim_blue_nolight
{
  q3map_lightimage textures/sfx/b_flame7
  qer_editorimage textures/sfx/b_flame7
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  {
    animMap 10 textures/sfx/b_flame1 textures/sfx/b_flame2 textures/sfx/b_flame3 textures/sfx/b_flame4 textures/sfx/b_flame5 textures/sfx/b_flame6 textures/sfx/b_flame7 textures/sfx/b_flame8
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 10
  }
  {
    animMap 10 textures/sfx/b_flame2 textures/sfx/b_flame3 textures/sfx/b_flame4 textures/sfx/b_flame5 textures/sfx/b_flame6 textures/sfx/b_flame7 textures/sfx/b_flame8 textures/sfx/b_flame1
    blendFunc add
    rgbGen wave sawtooth 0 1 0 10
  }
  {
    map textures/sfx/b_flameball
    blendFunc add
    rgbGen wave sin .6 .2 0 .6
  }
}
