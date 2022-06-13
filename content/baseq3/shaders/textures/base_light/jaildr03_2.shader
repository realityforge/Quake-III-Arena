textures/base_light/jaildr03_2
{
  q3map_surfacelight 1000
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/jaildr03_2
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/jaildr03_2_blend
    blendFunc add
    rgbGen wave sin .5 .5 1 1
  }
}
