textures/skies/skybox
{
  q3map_sun 1 1 1 100 -58 58
  q3map_surfacelight 400
  q3map_lightimage textures/skies/stars
  skyparms env/space1 - -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/killsky_2
    blendFunc add
    tcmod scroll .05 .06
    tcmod scale 3 2
  }
}
