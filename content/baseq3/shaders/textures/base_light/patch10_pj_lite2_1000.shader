textures/base_light/patch10_pj_lite2_1000
{
  q3map_surfacelight 1000
  qer_editorimage textures/base_light/patch10_pj_lite2
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
