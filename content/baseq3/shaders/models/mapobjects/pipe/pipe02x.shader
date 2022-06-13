models/mapobjects/pipe/pipe02x
{
  q3map_surfacelight 150
  q3map_lightimage textures/sfx/electricslime_old
  cull disable
  {
    map textures/effects/tinfx2b
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scale 1 2
  }
  {
    map textures/sfx/electricslime_old
    blendFunc add
    rgbGen identity
    tcmod scroll 7.2 1
  }
}
