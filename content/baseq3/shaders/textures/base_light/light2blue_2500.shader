textures/base_light/light2blue_2500
{
  q3map_surfacelight 2500
  q3map_lightimage textures/base_light/light1blue1_blend
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
    map textures/base_light/light1blue1_blend
    blendFunc add
  }
}
