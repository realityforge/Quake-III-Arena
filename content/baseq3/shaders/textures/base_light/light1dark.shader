textures/base_light/light1dark
{
  q3map_surfacelight 6000
  q3map_lightimage textures/base_light/light1_blend
  q3map_flare flareshader
  qer_editorimage textures/base_light/light1
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/light1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/light1_blend
    blendFunc add
  }
}
