models/mapobjects/techlamp/techlamp_rail2b
{
  cull disable
  surfaceparm alphashadow
  deformVertexes move 0 0 2 sin 0 4 .5 .33
  {
    map models/mapobjects/techlamp/techlamp_rail2b
    depthWrite
    alphaFunc GE128
    rgbGen vertex
  }
}
