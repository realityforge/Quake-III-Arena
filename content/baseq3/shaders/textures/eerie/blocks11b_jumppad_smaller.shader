textures/eerie/blocks11b_jumppad_smaller
{
  q3map_surfacelight 250
  surfaceparm nodamage
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/blocks11b_jumppad_smaller
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/jumppad_smaller
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
