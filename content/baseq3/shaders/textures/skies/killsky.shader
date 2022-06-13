textures/skies/killsky
{
  q3map_sun 3 2 2 70 315 65
  q3map_surfacelight 75
  qer_editorimage textures/skies/stars
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm sky
  {
    map textures/skies/killsky_1
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
