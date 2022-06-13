models/mapobjects/cross/cross
{
  q3map_surfacelight 300
  q3map_lightimage models/mapobjects/cross/cross_light
  {
    map textures/sfx/firewalla
    rgbGen identity
    tcmod scale 4 4
    tcmod scroll .1 2
  }
  {
    map models/mapobjects/cross/cross
    blendFunc blend
    rgbGen vertex
  }
}
