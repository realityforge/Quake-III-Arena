textures/base_light/xceil1_39_30k
{
  q3map_surfacelight 30000
  q3map_flare flareshader
  qer_editorimage textures/base_light/ceil1_39
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_39
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_39_blend
    blendFunc add
  }
}
