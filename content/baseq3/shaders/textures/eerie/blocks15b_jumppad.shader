textures/eerie/blocks15b_jumppad
{
  q3map_surfacelight 250
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/blocks15b_jumppad
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/jumppad
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
