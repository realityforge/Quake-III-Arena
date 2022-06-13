textures/gothic_light/ironcrosslt2_5000
{
  q3map_surfacelight 5000
  q3map_lightimage textures/gothic_light/ironcrosslt2_blend
  q3map_flare flareshader
  qer_editorimage textures/gothic_light/ironcrosslt2
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/ironcrosslt2
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/ironcrosslt2_blend
    blendFunc add
  }
}
