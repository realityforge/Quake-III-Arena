textures/base_light/jaildr03_1
{
  q3map_surfacelight 1000
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/jaildr03_1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/jaildr03_1
    blendFunc add
    rgbGen wave sin .5 .5 1 1
  }
}
