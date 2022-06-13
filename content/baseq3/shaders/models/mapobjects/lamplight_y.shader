models/mapobjects/lamplight_y
{
  q3map_surfacelight 10000
  q3map_flare flareshader
  cull disable
  {
    map textures/effects/envmapmach
    blendFunc add
    tcGen environment
    rgbGen identity
  }
}
