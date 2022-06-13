textures/skies/xtoxicsky_newctf1
{
  q3map_sun 1 1 .5 150 30 85
  q3map_surfacelight 200
  qer_editorimage textures/skies/toxicsky
  skyparms - 512 -
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
