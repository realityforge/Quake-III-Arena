textures/skies/tim_mpctf1
{
  q3map_sun .5 .6 .8 100 225 80
  q3map_surfacelight 130
  qer_editorimage textures/skies/toxicbluesky
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/bluedimclouds
    depthWrite
    tcmod scale 3 2
    tcmod scroll .15 .15
  }
  {
    map textures/skies/topclouds
    blendFunc add
    tcmod scale 3 3
    tcmod scroll .05 .05
  }
}
