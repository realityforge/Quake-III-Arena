models/mapobjects/teleporter/energy
{
  cull disable
  {
    map models/mapobjects/teleporter/energy
    blendFunc add
    rgbGen wave inversesawtooth -0.3 1.3 0 1.3
    tcmod scroll 2.2 1.3
  }
  {
    map models/mapobjects/teleporter/energy2
    blendFunc add
    rgbGen wave inversesawtooth -0.2 1.2 0 .5
    tcmod scroll -1 .5
  }
  {
    map models/mapobjects/teleporter/energy3
    blendFunc add
    rgbGen wave triangle 1 1 0 5.3
    tcmod scroll 3 0
  }
}
