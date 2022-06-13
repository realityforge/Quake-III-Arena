textures/hell/hellredclouds
{
  q3map_surfacelight 280
  surfaceparm noimpact
  surfaceparm nolightmap
  {
    map env/redclouds
    tcmod scroll .02 0
    tcmod scale 2 2
  }
  {
    map textures/dont_use/lightningsky8_kc
    blendFunc add
    tcmod scale 10 10
    tcmod scroll .2 .2
  }
  {
    map env/redcloudsa
    blendFunc add
    tcmod scale 3 3
    tcmod scroll .02 .01
  }
}
