models/mapobjects/lamps/beam
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm nonsolid
  surfaceparm trans
  deformVertexes move 0 0 2 sin 0 5 0 .3
  deformVertexes move .6 .8 0 sin 0 9 0 .1
  {
    map models/mapobjects/lamps/beam
    blendFunc add
    tcmod scroll .3 0
  }
  {
    map models/mapobjects/lamps/beam
    blendFunc add
    tcmod scroll -0.3 0
  }
}
