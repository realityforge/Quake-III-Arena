textures/skies/raster_test_sun
{
  q3map_sun 1 1 1 70 0 90
  q3map_surfacelight 50
  qer_editorimage textures/skies/dimclouds
  skyparms full 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/nightsky
    depthWrite
    tcmod scale 5 8
    tcmod scroll .7 .1
  }
  {
    map textures/skies/nightsky_nocloud
    blendFunc filter
    tcmod scale 3 5
    tcmod scroll .3 .1
  }
}
