textures/skies/mkc_dm4sky
{
  q3map_sun .9 .8 1 25 135 60
  q3map_surfacelight 80
  qer_editorimage textures/skies/dimclouds
  skyparms - 512 -
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
    map textures/skies/redclouds
    blendFunc filter
    tcmod scale 3 5
    tcmod scroll .3 .1
  }
}
