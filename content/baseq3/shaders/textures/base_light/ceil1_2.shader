textures/base_light/ceil1_2
{
  q3map_surfacelight 10000
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_2
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_2_blend
    blendFunc add
  }
}
