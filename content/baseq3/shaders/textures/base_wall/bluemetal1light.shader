textures/base_wall/bluemetal1light
{
  q3map_surfacelight 1000
  q3map_lightimage textures/base_wall/bluemetal1light_bl
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures//base_wall/bluemetal1light
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall/bluemetal1light_bl
    blendFunc add
    rgbGen wave sin .5 .1 1 .5
  }
}
