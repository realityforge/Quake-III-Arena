textures/gothic_light/gothic_light2_2K
{
  q3map_surfacelight 2000
  q3map_flare flareshader
  qer_editorimage textures/gothic_light/gothic_light2
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/gothic_light2
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/gothic_light2_blend
    blendFunc add
    rgbGen wave sin .6 .1 .1 .1
  }
}