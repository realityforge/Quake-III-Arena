textures/base_light/ceil1_22a_8k
{
  q3map_surfacelight 8000
  q3map_flare flareshader
  qer_editorimage textures/base_light/ceil1_22a
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
