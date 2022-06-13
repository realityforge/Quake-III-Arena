textures/hell/hellbutt01
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/hell/hellbutt01
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/hell/hellbutt01_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
