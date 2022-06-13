models/mapobjects/techlamp/techlamp_pole
{
  deformVertexes normal .1 .03
  {
    map models/mapobjects/techlamp/techlamp_pole2
    tcGen environment
    rgbGen identity
    tcmod scale 1 2
    tcmod scroll 0 .3
  }
  {
    map models/mapobjects/techlamp/techlamp_pole
    blendFunc blend
    rgbGen vertex
  }
}
