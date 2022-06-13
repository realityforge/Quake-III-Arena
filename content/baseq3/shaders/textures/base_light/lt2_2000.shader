textures/base_light/lt2_2000
{
  q3map_surfacelight 2000
  q3map_flare flareshader
  qer_editorimage textures/base_light/light2
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/light2
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/light2_blend
    blendFunc add
    rgbGen wave sin .6 .1 .1 .1
  }
}
