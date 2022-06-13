textures/eerie/xian_light3_7
{
  q3map_surfacelight 5000
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/xian_light3_7
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/xian_light3_7_blend
    blendFunc add
  }
}
