models/mapobjects/jets/jet_1
{
  cull disable
  nomipmaps
  surfaceparm trans
  {
    map models/mapobjects/jets/jet_1
    blendFunc add
    rgbGen identity
    tcmod scale .5 1
    tcmod scroll 6 0
  }
  {
    map models/mapobjects/jets/jet_2
    blendFunc add
    rgbGen wave inversesawtooth -0.3 1.3 0 .5
    tcmod scroll 3 -0.5
  }
}
