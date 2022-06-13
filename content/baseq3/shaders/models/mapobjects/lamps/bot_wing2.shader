models/mapobjects/lamps/bot_wing2
{
  cull disable
  deformVertexes move 0 0 2 sin 0 5 0 .3
  deformVertexes move .6 .8 0 sin 0 9 0 .1
  deformVertexes wave 100 sin 0 .5 0 .5
  {
    map models/mapobjects/lamps/bot_wing2
    depthWrite
    alphaFunc GE128
    rgbGen vertex
  }
}
