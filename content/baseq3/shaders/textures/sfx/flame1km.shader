textures/sfx/flame1km
{
  q3map_surfacelight 4000
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  {
    animMap 10 textures/sfx/flame1 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 10
  }
  {
    animMap 10 textures/sfx/flame2 textures/sfx/flame3 textures/sfx/flame4 textures/sfx/flame5 textures/sfx/flame6 textures/sfx/flame7 textures/sfx/flame8 textures/sfx/flame1
    blendFunc add
    rgbGen wave sawtooth 0 1 0 10
  }
  {
    map textures/sfx/flameball
    blendFunc add
    rgbGen wave sin .6 .2 0 .6
  }
}
