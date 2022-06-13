models/mapobjects/console/sphere
{
  cull disable
  {
    map models/mapobjects/console/spherex2
    blendFunc add
    tcGen environment
    rgbGen wave sin .5 .5 0 .2
    tcmod rotate 40
    tcmod scroll 5 .4
  }
  {
    map models/mapobjects/console/spherex
    blendFunc add
    tcGen environment
    rgbGen wave sin .5 .5 0 -0.2
    tcmod rotate 40
    tcmod scroll 5 .4
  }
}
