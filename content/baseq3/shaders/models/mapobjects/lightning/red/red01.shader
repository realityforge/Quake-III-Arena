models/mapobjects/lightning/red/red01
{
  q3map_surfacelight 3000
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes wave 100 sin 0 1 0 5
  {
    animMap 15 models/mapobjects/lightning/red/red01 models/mapobjects/lightning/red/red02 models/mapobjects/lightning/red/red03 models/mapobjects/lightning/red/red04 models/mapobjects/lightning/red/red05 models/mapobjects/lightning/red/red06 models/mapobjects/lightning/red/red07 models/mapobjects/lightning/red/red08
    blendFunc add
    rgbGen vertex
  }
}
