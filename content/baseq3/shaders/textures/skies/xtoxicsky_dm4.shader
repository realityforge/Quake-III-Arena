textures/skies/xtoxicsky_dm4
{
  q3map_sun 1 1 .95 50 40 90
  q3map_surfacelight 80
  qer_editorimage textures/skies/toxicsky
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/inteldimclouds
    depthWrite
    tcmod scroll .1 .1
    tcmod scale 3 2
  }
  {
    map textures/skies/intelredclouds
    blendFunc add
    tcmod scroll .05 .05
    tcmod scale 3 3
  }
}
