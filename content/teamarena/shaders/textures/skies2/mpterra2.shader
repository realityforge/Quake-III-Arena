textures/skies2/mpterra2
{
  q3map_sun 1 1 1 200 180 85
  q3map_surfacelight 90
  qer_editorimage textures/skies/toxicbluesky
  skyparms - 1024 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/bluedimclouds
    depthWrite
    tcmod scale 3 2
    tcmod scroll .0355 .0355
  }
  {
    map textures/skies/topclouds
    blendFunc add
    tcmod scale 3 3
    tcmod scroll .0125 .0125
  }
}
