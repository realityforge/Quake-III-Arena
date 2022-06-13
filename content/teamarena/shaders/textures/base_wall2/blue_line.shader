textures/base_wall2/blue_line
{
  q3map_surfacelight 100
  q3map_lightimage textures/base_wall2/blue_line_glow
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_wall2/blue_line
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall2/blue_line_glow
    blendFunc add
  }
}
