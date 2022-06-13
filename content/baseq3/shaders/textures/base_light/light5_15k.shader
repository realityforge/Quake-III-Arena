textures/base_light/light5_15k
{
  q3map_surfacelight 15000
  q3map_lightimage textures/base_light/light5_blend
  q3map_flare flareshader
  qer_editorimage textures/base_light/light5
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/light5
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/light5
    blendFunc add
  }
}
