textures/skies/hellsky
{
  q3map_sun 5 3 3 60 290 75
  q3map_surfacelight 90
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/redclouds
    depthWrite
    tcmod scroll .05 0
    tcmod scale 2 2
  }
  {
    map textures/skies/dimclouds
    blendFunc add
    tcmod scroll .05 .06
  }
}
