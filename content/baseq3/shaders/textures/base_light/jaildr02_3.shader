textures/base_light/jaildr02_3
{
  q3map_surfacelight 1000
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/jaildr02_3
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/jaildr02_3_blend
    blendFunc add
    rgbGen wave sin .5 .5 1 1
  }
}
