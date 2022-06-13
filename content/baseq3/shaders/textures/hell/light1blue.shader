textures/hell/light1blue
{
  q3map_surfacelight 3250
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/hell/light1blue
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/hell/light1blue_blend
    blendFunc add
    rgbGen wave sin .5 .1 0 .2
  }
}
