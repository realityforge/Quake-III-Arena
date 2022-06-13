textures/base_light/baslt4_1_4k
{
  q3map_surfacelight 4000
  qer_editorimage textures/base_light/baslt4_1
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/baslt4_1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/baslt4_1_blend
    blendFunc add
  }
}
