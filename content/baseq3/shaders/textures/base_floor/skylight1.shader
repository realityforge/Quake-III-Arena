textures/base_floor/skylight1
{
  q3map_surfacelight 100
  q3map_lightimage textures/base_floor/skylight1_lm
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_floor/skylight1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_floor/skylight1_lm
    blendFunc add
    rgbGen wave triangle .2 2 0 7.7
  }
  {
    map textures/base_floor/skylight1_lm
    blendFunc add
    rgbGen wave triangle .2 5 1 5.1
  }
}
