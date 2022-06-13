models/mapobjects/lamps/bot_flare2
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes move 0 0 3 sin 0 5 0 .1
  deformVertexes move 2 2 0 sin 0 9 0 .05
  deformVertexes wave 100 sin 0 1 0 9
  {
    map models/mapobjects/lamps/bot_flare2
    blendFunc add
  }
}
