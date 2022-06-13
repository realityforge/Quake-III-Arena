models/mapobjects/gratelamp/gratelight_flare
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes autoSprite
  {
    map models/mapobjects/gratelamp/gratelight_flare
    blendFunc add
    rgbGen wave sin .5 .2 0 0
  }
}
