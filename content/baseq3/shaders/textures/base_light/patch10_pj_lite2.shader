textures/base_light/patch10_pj_lite2
{
  q3map_surfacelight 2000
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/patch10_pj_lite2
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/patch10_pj_lite2_blend
    blendFunc add
  }
}
