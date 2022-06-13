textures/base_light/baslt3_1_2K
{
  q3map_surfacelight 2000
  qer_editorimage textures/base_light/baslt3_1
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/baslt3_1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/baslt3_1_blend
    blendFunc add
  }
}
