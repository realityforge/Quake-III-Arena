textures/base_light/ceil1_35
{
  q3map_surfacelight 10000
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_35
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_35_blend
    blendFunc add
  }
}
