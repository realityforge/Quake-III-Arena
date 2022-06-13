textures/base_light/scrolllight
{
  q3map_surfacelight 100
  q3map_lightimage textures/sfx/scrolllight2
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/scrolllight
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/scrolllight2
    blendFunc add
    tcmod scroll -1 0
  }
  {
    map textures/base_light/scrolllight2
    blendFunc add
    tcmod scroll -2 0
  }
}
