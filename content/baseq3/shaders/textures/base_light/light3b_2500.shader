textures/base_light/light3b_2500
{
  q3map_surfacelight 2500
  q3map_flare flareshader
  qer_editorimage textures/base_light/light3b
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/light3b
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/light3b_blend
    blendFunc add
  }
}
