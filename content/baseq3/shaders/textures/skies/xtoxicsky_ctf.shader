textures/skies/xtoxicsky_ctf
{
  q3map_sun 1 1 .5 150 30 60
  q3map_surfacelight 500
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