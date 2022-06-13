textures/gothic_light/gothic_light2_lrg_500
{
  q3map_surfacelight 500
  q3map_flare flareshader
  qer_editorimage textures/gothic_light/gothic_light2_lrg
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/gothic_light2_lrg
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/gothic_light2_blend
    blendFunc add
  }
}
