textures/base_light/baslt4_1_2k
{
  q3map_surfacelight 2000
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
