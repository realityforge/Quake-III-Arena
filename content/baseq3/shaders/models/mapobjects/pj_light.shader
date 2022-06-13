models/mapobjects/pj_light
{
  cull disable
  {
    map textures/effects/tinfx2
    blendFunc add
    tcGen environment
    rgbGen vertex
  }
  {
    map models/mapobjects/pj_light
    blendFunc add
    rgbGen vertex
  }
}
