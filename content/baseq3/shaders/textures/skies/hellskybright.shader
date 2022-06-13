textures/skies/hellskybright
{
  q3map_sun 4 3 3 80 45 75
  q3map_surfacelight 60
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/dimclouds
    depthWrite
    tcmod scroll .05 0
    tcmod scale 2 2
  }
  {
    map textures/skies/redclouds
    blendFunc add
    tcmod scroll .05 .06
  }
}
