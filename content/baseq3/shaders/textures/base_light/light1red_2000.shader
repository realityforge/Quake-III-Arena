textures/base_light/light1red_2000
{
  q3map_surfacelight 2000
  q3map_lightimage textures/base_light/light1red_blend
  q3map_flare flareshader
  qer_editorimage textures/base_light/light1red
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/light1red
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/light1red_blend
    blendFunc add
  }
}
