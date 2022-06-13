textures/base_trim/border12b_pj
{
  q3map_surfacelight 150
  q3map_lightimage textures/base_trim/border12bfx
  qer_editorimage textures/base_trim/border12b
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_trim/border12b
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_trim/border12bfx
    blendFunc add
  }
}
