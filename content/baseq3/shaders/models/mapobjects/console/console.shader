models/mapobjects/console/console
{
  cull disable
  {
    map textures/effects/tinfx2c
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen vertex
  }
  {
    map models/mapobjects/console/console
    blendFunc blend
    rgbGen vertex
  }
  {
    map models/mapobjects/console/console2
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
