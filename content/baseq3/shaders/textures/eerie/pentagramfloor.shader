textures/eerie/pentagramfloor
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/pentagramfloor
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/pentagramfloor_red_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
