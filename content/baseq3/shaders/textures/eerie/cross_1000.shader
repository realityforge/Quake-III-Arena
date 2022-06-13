textures/eerie/cross_1000
{
  q3map_surfacelight 1000
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/cross_1000
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/cross_1000_blend
    blendFunc add
  }
}
