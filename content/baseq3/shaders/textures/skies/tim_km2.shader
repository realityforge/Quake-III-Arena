textures/skies/tim_km2
{
  q3map_sun .5 .37 .19 90 315 40
  q3map_surfacelight 80
  qer_editorimage textures/skies/stars_red
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm sky
  {
    map textures/skies/killsky_1
    depthWrite
    tcmod scroll .05 .1
    tcmod scale 2 2
  }
  {
    map textures/skies/killsky_2
    blendFunc add
    tcmod scroll .05 .06
    tcmod scale 3 2
  }
}
