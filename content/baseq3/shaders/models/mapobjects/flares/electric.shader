models/mapobjects/flares/electric
{
  q3map_surfacelight 200
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  {
    clampmap models/mapobjects/flares/electric
    blendFunc add
    rgbGen wave triangle .8 2 0 9
    tcmod rotate 360
  }
  {
    clampmap models/mapobjects/flares/electric
    blendFunc add
    rgbGen wave triangle 1 1.4 0 9.5
    tcmod rotate -202
  }
}
