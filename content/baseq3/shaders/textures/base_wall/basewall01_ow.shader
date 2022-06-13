textures/base_wall/basewall01_ow
{
  q3map_lightimage textures/base_wall/basewall01_owfx
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_wall/basewall01_ow
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall/basewall01_owfx
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
