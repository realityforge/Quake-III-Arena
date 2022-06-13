textures/base_wall/future9light
{
  q3map_surfacelight 400
  q3map_lightimage textures/base_wall/future9light_color
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_wall/future9light
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall/future9light_blend
    blendFunc add
    rgbGen wave sin .5 .1 1 .5
  }
}
