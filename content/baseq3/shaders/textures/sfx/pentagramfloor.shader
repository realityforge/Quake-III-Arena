textures/sfx/pentagramfloor
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/sfx/pentagramfloor
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/pentagramfloor_red_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
