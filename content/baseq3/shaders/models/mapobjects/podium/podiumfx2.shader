models/mapobjects/podium/podiumfx2
{
  cull disable
  surfaceparm trans
  {
    map models/mapobjects/podium/podiumfx1
    blendFunc add
    rgbGen wave inversesawtooth 0 1 .7 .6
    tcmod scale 1 .5
    tcmod scroll .8 -0.3
  }
  {
    map models/mapobjects/podium/podiumfx1b
    blendFunc add
    rgbGen wave inversesawtooth 0 1 .7 .6
    tcmod scale 1 .5
    tcmod scroll -1.7 -0.3
  }
  {
    map models/mapobjects/podium/podiumfx1b
    blendFunc add
    rgbGen wave inversesawtooth 0 1 .7 .6
    tcmod scale 1 .5
    tcmod scroll -1.1 -0.3
  }
}