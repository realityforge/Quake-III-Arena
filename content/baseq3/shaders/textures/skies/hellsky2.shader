textures/skies/hellsky2
{
  q3map_sun .9 .9 1 70 65 78
  q3map_surfacelight 60
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/dimclouds
    depthWrite
    tcmod scroll .02 0
  }
  {
    map textures/skies/dimclouds
    blendFunc add
    tcmod scroll .02 .01
    tcmod scale 3 3
  }
}
