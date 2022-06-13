textures/gothic_light/crosslt1
{
  q3map_surfacelight 3250
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/crosslt1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/crosslt1_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
