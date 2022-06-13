textures/base_light/light6_2500
{
  q3map_surfacelight 2500
  q3map_flare flareshader
  qer_editorimage textures/base_light/light6
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/light6
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/light6_blend
    blendFunc add
  }
}
