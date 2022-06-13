textures/base_light/ceil1_34_5k
{
  q3map_surfacelight 5000
  q3map_flare flareshader
  qer_editorimage textures/base_light/ceil1_34
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_34
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/ceil1_34_blend
    blendFunc add
  }
}
