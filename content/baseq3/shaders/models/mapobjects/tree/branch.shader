models/mapobjects/tree/branch
{
  cull disable
  surfaceparm trans
  deformVertexes wave 100 sin 0 .1 0 .2
  {
    map models/mapobjects/tree/branch
    depthWrite
    alphaFunc GE128
    rgbGen vertex
  }
}
