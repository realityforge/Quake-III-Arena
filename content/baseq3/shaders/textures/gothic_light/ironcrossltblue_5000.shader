textures/gothic_light/ironcrossltblue_5000
{
  q3map_surfacelight 5000
  q3map_lightimage textures/gothic_light/ironcrossltblue_blend
  q3map_flare flareshader
  qer_editorimage textures/gothic_light/ironcrossltblue
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/ironcrossltblue
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/ironcrossltblue_blend
    blendFunc add
  }
}
