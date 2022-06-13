textures/eerie/xgoopy_pentagram
{
  q3map_surfacelight 250
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/xgoopq1metal
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/eerie/pentagramfloor_red_blend
    blendFunc add
    tcmod rotate -60
  }
}
