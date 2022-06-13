textures/base_light/ceil1_4
{
  q3map_surfacelight 10000
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_4
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_4_blend
    blendFunc add
  }
}
