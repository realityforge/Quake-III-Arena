textures/eerie/cross_2500
{
  q3map_surfacelight 2500
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/cross_2500
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/cross_2500_blend
    blendFunc add
  }
}
