textures/base_light/wsupprt1_12h
{
  q3map_surfacelight 1000
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/wsupprt1_12h
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/wsupprt1_12h_blend
    blendFunc add
    rgbGen wave sin .5 .5 1 1
  }
}
