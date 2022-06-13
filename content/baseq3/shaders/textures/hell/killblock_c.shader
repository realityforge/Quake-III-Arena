textures/hell/killblock_c
{
  q3map_surfacelight 50
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/hell/killblock_c
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/hell/killblock_c_blend
    blendFunc add
    rgbGen wave sin .5 .1 0 .2
  }
}
