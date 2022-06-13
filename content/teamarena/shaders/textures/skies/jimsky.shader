textures/skies/jimsky
{
  q3map_sun 1 1 1 300 120 75
  q3map_surfacelight 20
  qer_editorimage textures/skies/pjbasesky
  skyparms - 4096 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/dimclouds
    depthWrite
    tcmod scroll .015 .016
    tcmod scale 3 3
  }
  {
    map textures/skies/pjbasesky
    blendFunc add
    tcmod scroll -0.01 -0.012
    tcmod scale 5 5
  }
}
