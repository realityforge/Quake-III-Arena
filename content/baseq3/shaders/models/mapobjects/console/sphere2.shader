models/mapobjects/console/sphere2
{
  cull disable
  deformVertexes autoSprite
  {
    map models/mapobjects/console/sphere3
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
  {
    map models/mapobjects/console/sphere4
    blendFunc add
    rgbGen wave sin .5 .5 0 -0.2
  }
  {
    clampmap models/mapobjects/console/sphere2
    alphaFunc GE128
    rgbGen identity
    tcmod rotate 40
  }
}
