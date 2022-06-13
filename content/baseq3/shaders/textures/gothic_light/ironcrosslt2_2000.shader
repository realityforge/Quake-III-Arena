textures/gothic_light/ironcrosslt2_2000
{
  q3map_surfacelight 2000
  q3map_lightimage textures/gothic_light/ironcrosslt2_blend
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
