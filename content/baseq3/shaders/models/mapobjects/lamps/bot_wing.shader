models/mapobjects/lamps/bot_wing
{
  cull disable
  deformVertexes move 0 0 3 sin 0 5 0 .1
  deformVertexes move 2 2 0 sin 0 9 0 .05
  deformVertexes wave 100 sin 0 .5 0 .5
  {
    map models/mapobjects/lamps/bot_wing
    depthWrite
    alphaFunc GE128
    rgbGen vertex
  }
}
