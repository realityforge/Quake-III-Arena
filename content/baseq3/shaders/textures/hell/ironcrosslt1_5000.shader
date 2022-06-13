textures/hell/ironcrosslt1_5000
{
  q3map_surfacelight 5000
  q3map_lightimage textures/hell/ironcrosslt1_blend
  q3map_flare flareshader
  qer_editorimage textures/hell/ironcrosslt1
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/hell/ironcrosslt1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/hell/ironcrosslt1_blend
    blendFunc add
  }
}
