textures/hell/bluepad
{
  q3map_surfacelight 2000
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/hell/bluepad
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/hell/bluepad_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
