textures/gothic_light/gothic_light3_20K
{
  q3map_surfacelight 20000
  q3map_lightimage textures/gothic_light/gothic_light2_blend
  q3map_flare flareshader
  qer_editorimage textures/gothic_light/gothic_light3
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/gothic_light3
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/gothic_light2_blend
    blendFunc add
    rgbGen wave sin .6 .1 .1 .1
  }
}
