textures/skies/kc_dm10sky
{
  q3map_sun .5 .6 .8 90 225 55
  q3map_surfacelight 150
  q3map_lightsubdivide 512
  q3map_globaltexture
  qer_editorimage textures/skies/toxicbluesky
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  {
    map textures/skies/bluedimclouds
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
