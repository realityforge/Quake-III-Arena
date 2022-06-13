textures/jk_tourney1/jk_toxicsky_dm1
{
  q3map_sun 1 1 .5 110 90 70
  q3map_surfacelight 280
  q3map_lightsubdivide 512
  qer_editorimage textures/jk_tourney1/jk_toxicsky_dm1
  skyparms - 256 -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
  {
    map textures/jk_tourney1/jk_inteldimclouds
    depthWrite
    tcmod scroll .03 .03
    tcmod scale 3 2
  }
  {
    map textures/jk_tourney1/jk_intelredclouds
    blendFunc add
    tcmod scroll .01 .01
    tcmod scale 3 3
  }
}
