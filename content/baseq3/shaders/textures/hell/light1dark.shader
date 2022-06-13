textures/hell/light1dark
{
  q3map_surfacelight 6000
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/hell/light1dark
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/hell/light1dark
    blendFunc add
  }
}
