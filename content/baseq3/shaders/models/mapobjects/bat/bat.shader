models/mapobjects/bat/bat
{
  cull disable
  deformVertexes wave 10 sin 0 3 0 3
  deformVertexes move 500 0 0 sawtooth 0 5 0 .1
  deformVertexes move 0 0 7 sin 0 5 0 .5
  {
    map models/mapobjects/bat/bat
    depthWrite
    alphaFunc GE128
    rgbGen identity
  }
}
