textures/skies/toxicskytim_ctf1
{
  q3map_sun 1 1 .5 90 70 40
  q3map_surfacelight 120
  qer_editorimage textures/skies/toxicsky
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/inteldimclouds
    depthWrite
    tcmod scale 3 2
    tcmod scroll .15 .15
  }
  {
    map textures/skies/intelredclouds
    blendFunc add
    tcmod scale 3 3
    tcmod scroll .05 .05
  }
}
