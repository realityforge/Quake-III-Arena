textures/base_wall/dooreye
{
  q3map_surfacelight 300
  q3map_lightimage textures/base_wall/dooreyelight
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_wall/dooreye
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall/dooreyelight
    blendFunc add
    rgbGen wave triangle .5 .5 0 .5
  }
}
