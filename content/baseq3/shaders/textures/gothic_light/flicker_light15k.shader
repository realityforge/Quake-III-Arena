textures/gothic_light/flicker_light15k
{
  q3map_surfacelight 15000
  q3map_lightimage textures/gothic_light/gothic_light2_blend
  q3map_flare flareshader
  qer_editorimage textures/gothic_light/gothic_light3
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen wave noise .75 .25 0 10
  }
  {
    map textures/gothic_light/gothic_light3
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/gothic_light2_blend
    blendFunc add
    rgbGen wave noise .75 .25 0 10
  }
}
