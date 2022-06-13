models/mapobjects/wallhead/femhead
{
  cull disable
  deformVertexes wave 100 sin 0 .7 0 .2
  {
    map models/mapobjects/wallhead/femhead3
    rgbGen vertex
  }
  {
    map models/mapobjects/wallhead/femhead4
    blendFunc blend
    rgbGen vertex
    alphaGen wave sin 0 1 1 .1
  }
}
