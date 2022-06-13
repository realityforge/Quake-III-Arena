textures/jk_dm1/jk_toxicsky_dm1
{
  q3map_sun 1 1 .5 100 90 70
  q3map_surfacelight 220
  qer_editorimage textures/jk_dm1/jk_toxicsky_dm1
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/jk_dm1/jk_inteldimclouds
    depthWrite
    tcmod scroll .03 .03
    tcmod scale 3 2
  }
  {
    map textures/jk_dm1/jk_intelredclouds
    blendFunc add
    tcmod scroll .01 .01
    tcmod scale 3 3
  }
}
