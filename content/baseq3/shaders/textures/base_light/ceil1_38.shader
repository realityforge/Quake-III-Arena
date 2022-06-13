textures/base_light/ceil1_38
{
  q3map_surfacelight 2500
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_38
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_38_blend
    blendFunc add
  }
}
