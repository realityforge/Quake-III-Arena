textures/skies/pj_dm9sky
{
  q3map_sun .5 .6 .8 140 165 60
  q3map_surfacelight 80
  q3map_lightsubdivide 512
  q3map_lightimage textures/skies/topclouds
  q3map_globaltexture
  qer_editorimage textures/skies/toxicbluesky
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm nomarks
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
