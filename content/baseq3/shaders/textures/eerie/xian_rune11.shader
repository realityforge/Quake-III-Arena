textures/eerie/xian_rune11
{
  q3map_surfacelight 1000
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/xian_rune11
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/xian_rune11_blend
    blendFunc add
  }
}
