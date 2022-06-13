textures/base_light/light5_10k
{
  q3map_surfacelight 10000
  q3map_lightimage textures/base_light/xlight5_blend
  q3map_flare flareshader
  qer_editorimage textures/base_light/light5
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/xlight5
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/xlight5_blend
    blendFunc add
  }
}
