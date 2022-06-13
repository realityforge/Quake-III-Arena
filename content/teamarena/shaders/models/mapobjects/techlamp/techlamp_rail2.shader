models/mapobjects/techlamp/techlamp_rail2
{
  cull disable
  surfaceparm alphashadow
  deformVertexes move 0 0 2 sin 0 4 0 .33
  {
    map models/mapobjects/techlamp/techlamp_rail2
    depthWrite
    alphaFunc GE128
    rgbGen vertex
  }
}
