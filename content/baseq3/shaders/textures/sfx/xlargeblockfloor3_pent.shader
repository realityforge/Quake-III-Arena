textures/sfx/xlargeblockfloor3_pent
{
  q3map_surfacelight 100
  q3map_lightimage textures/sfx/pentagramfloor_blue3glowtest
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/sfx/xlargeblockfloor3_pent
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/pentagramfloor_blue3glowtest
    blendFunc add
    rgbGen wave sin .9 .1 0 5
  }
}
