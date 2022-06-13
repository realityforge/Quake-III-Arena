textures/base_light/ceil1_38_40k
{
  q3map_surfacelight 40000
  q3map_flare flareshader
  qer_editorimage textures/base_light/ceil1_38
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
