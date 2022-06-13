textures/base_light/patch10_pj_lite
{
  q3map_surfacelight 2500
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/patch10_pj_lite
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/patch10_pj_lite_blend
    blendFunc add
  }
}
