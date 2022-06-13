textures/base_trim/border12b
{
  q3map_surfacelight 1000
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
