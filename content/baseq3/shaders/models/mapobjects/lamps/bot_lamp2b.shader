models/mapobjects/lamps/bot_lamp2b
{
  cull disable
  deformVertexes move 0 0 2 sin 0 5 0 .3
  deformVertexes move .6 .8 0 sin 0 9 0 .1
  {
    map models/mapobjects/lamps/bot_lamp2b
    depthWrite
    alphaFunc GE128
    rgbGen vertex
  }
}
