textures/jk_dm1/runway_dblue
{
  q3map_surfacelight 400
  q3map_lightimage textures/jk_dm1/runway_glow_dblue
  surfaceparm nomarks
  {
    map textures/jk_dm1/runway_glow_dblue
    rgbGen wave square -1 2 .5 8
    tcmod scale 1 .25
    tcmod scroll 0 .5
  }
  {
    map textures/jk_dm1/runway_dblue
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/jk_dm1/runwayb_dblue
    blendFunc add
    rgbGen identity
  }
}
