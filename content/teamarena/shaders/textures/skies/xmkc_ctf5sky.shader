textures/skies/xmkc_ctf5sky
{
  q3map_sun .9 .8 1 80 80 60
  q3map_surfacelight 185
  qer_editorimage textures/skies/dimclouds
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/skies/nightsky
    depthWrite
    tcmod scale 5 8
    tcmod scroll .7 .1
  }
  {
    map textures/skies/nightsky_nocloud
    blendFunc filter
    tcmod scale 3 5
    tcmod scroll .3 .1
  }
}
