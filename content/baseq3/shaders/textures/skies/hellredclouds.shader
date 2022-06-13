textures/skies/hellredclouds
{
  q3map_sun 5 2 2 60 135 90
  q3map_surfacelight 80
  q3map_lightsubdivide 512
  q3map_globaltexture
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/redclouds
    tcmod scroll .02 0
    tcmod scale 2 2
  }
  {
    map textures/skies/lightningsky8_kc
    blendFunc add
    tcmod scale 10 10
    tcmod scroll .2 .2
  }
  {
    map textures/skies/redcloudsa
    blendFunc add
    tcmod scale 3 3
    tcmod scroll .02 .01
  }
}
