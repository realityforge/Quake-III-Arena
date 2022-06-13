textures/skies/hellskyteam
{
  q3map_sun 5 3 6 40 80 70
  q3map_surfacelight 45
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/dimclouds
    depthWrite
    tcmod scroll .1 .1
    tcmod scale 3 2
  }
  {
    map textures/skies/redcloudsa
    blendFunc add
    tcmod scroll .05 .05
    tcmod scale 3 3
  }
}
