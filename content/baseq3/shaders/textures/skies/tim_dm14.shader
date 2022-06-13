textures/skies/tim_dm14
{
  q3map_sun 3 2 2 90 314 60
  q3map_surfacelight 80
  qer_editorimage textures/skies/stars
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
