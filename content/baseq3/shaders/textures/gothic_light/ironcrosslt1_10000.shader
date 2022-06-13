textures/gothic_light/ironcrosslt1_10000
{
  q3map_surfacelight 10000
  q3map_lightimage textures/gothic_light/ironcrosslt1_blend
  q3map_flare flareshader
  qer_editorimage textures/gothic_light/ironcrosslt1
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/ironcrosslt1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/ironcrosslt1_blend
    blendFunc add
  }
}
