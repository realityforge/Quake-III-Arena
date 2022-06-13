textures/base_light/light5_20k
{
  q3map_surfacelight 20000
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
    map textures/base_light/light5_blend
    blendFunc add
  }
}
