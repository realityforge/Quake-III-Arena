textures/sfx/xgoopy_pentagram
{
  q3map_surfacelight 250
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/sfx/xgoopq1metal
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/sfx/pentagramfloor_red_blend
    blendFunc add
    tcmod rotate -60
  }
}
