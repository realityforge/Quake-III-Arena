textures/eerie/xian_rune21
{
  q3map_surfacelight 1000
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/xian_rune21
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/xian_rune21_blend
    blendFunc add
  }
}
