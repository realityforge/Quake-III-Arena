textures/base_light/pj_wstlt1_3k
{
  q3map_surfacelight 3000
  q3map_lightimage textures/base_light/wstlt1_5_blend
  q3map_flare flareshader
  qer_editorimage textures/base_light/wstlt1_5
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
