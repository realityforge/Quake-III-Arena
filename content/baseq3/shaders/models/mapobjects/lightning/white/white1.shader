models/mapobjects/lightning/white/white1
{
  q3map_surfacelight 3000
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes wave 100 sin 0 1 0 5
  {
    animMap 15 models/mapobjects/lightning/white/white1 models/mapobjects/lightning/white/white2 models/mapobjects/lightning/white/white3 models/mapobjects/lightning/white/white4 models/mapobjects/lightning/white/white5 models/mapobjects/lightning/white/white6 models/mapobjects/lightning/white/white7 models/mapobjects/lightning/white/white8
    blendFunc add
    rgbGen vertex
  }
}
