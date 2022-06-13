textures/base_light/ceil1_22a
{
  q3map_surfacelight 10000
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_22a
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_22a_blend
    blendFunc add
  }
}
