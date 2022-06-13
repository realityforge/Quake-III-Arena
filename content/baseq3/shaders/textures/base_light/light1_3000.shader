textures/base_light/light1_3000
{
  q3map_surfacelight 1500
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
