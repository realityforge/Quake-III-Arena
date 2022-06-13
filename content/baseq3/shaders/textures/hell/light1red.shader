textures/hell/light1red
{
  q3map_surfacelight 5000
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/hell/light1red
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/hell/light1red_blend
    blendFunc add
    rgbGen wave sin .5 .1 0 .2
  }
}
