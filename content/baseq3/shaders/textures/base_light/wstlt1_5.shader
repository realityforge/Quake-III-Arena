textures/base_light/wstlt1_5
{
  q3map_surfacelight 2000
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/wstlt1_5
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/wstlt1_5_blend
    blendFunc add
  }
}
