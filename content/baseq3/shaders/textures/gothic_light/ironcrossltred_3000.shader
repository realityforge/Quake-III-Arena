textures/gothic_light/ironcrossltred_3000
{
  q3map_surfacelight 3000
  q3map_lightimage textures/gothic_light/ironcrossltred_blend
  q3map_flare flareshader
  qer_editorimage textures/gothic_light/ironcrossltred
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/ironcrossltred
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/ironcrossltred_blend
    blendFunc add
  }
}
