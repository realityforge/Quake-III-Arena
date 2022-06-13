textures/base_light/ceil1_30_8k
{
  q3map_surfacelight 8000
  q3map_flare flareshader
  qer_editorimage textures/base_light/ceil1_30
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_30
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_30_blend
    blendFunc add
  }
}
