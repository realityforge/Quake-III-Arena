textures/base_object/quadsign_1
{
  q3map_surfacelight 1000
  q3map_lightimage textures/base_object/quadsign1_blend
  qer_editorimage base_object/quadsign1
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_object/quadsign1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_object/quadsign1_blend
    blendFunc add
    rgbGen wave triangle .5 .5 .5 .15
  }
}
