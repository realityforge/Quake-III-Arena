textures/sfx/flameanim_green_pj
{
  q3map_surfacelight 2500
  q3map_lightimage textures/sfx/g_flame6
  qer_editorimage textures/sfx/g_flame6
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  {
    animMap 10 textures/sfx/g_flame1 textures/sfx/g_flame2 textures/sfx/g_flame3 textures/sfx/g_flame4 textures/sfx/g_flame5 textures/sfx/g_flame6 textures/sfx/g_flame7 textures/sfx/g_flame8
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 10
  }
  {
    animMap 10 textures/sfx/g_flame2 textures/sfx/g_flame3 textures/sfx/g_flame4 textures/sfx/g_flame5 textures/sfx/g_flame6 textures/sfx/g_flame7 textures/sfx/g_flame8 textures/sfx/g_flame1
    blendFunc add
    rgbGen wave sawtooth 0 1 0 10
  }
  {
    map textures/sfx/g_flameball
    blendFunc add
    rgbGen wave sin .6 .2 0 .6
  }
}
