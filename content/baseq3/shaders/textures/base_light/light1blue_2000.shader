textures/base_light/light1blue_2000
{
  q3map_surfacelight 2000
  q3map_lightimage textures/base_light/light1blue_blend
  q3map_flare flareshader
  qer_editorimage textures/base_light/light1blue
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/light1blue
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/light1blue_blend
    blendFunc add
  }
}
