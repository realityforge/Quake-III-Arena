textures/skies/dc_hell
{
  q3map_sun 1 .77 .77 80 315 70
  q3map_surfacelight 60
  qer_editorimage textures/skies/stars_red
  skyparms - 384 -
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
