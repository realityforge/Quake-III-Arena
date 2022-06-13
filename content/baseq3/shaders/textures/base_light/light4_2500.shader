textures/base_light/light4_2500
{
  q3map_surfacelight 2500
  q3map_flare flareshader
  qer_editorimage textures/base_light/light4
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/light4
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/light4_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 3
  }
}
