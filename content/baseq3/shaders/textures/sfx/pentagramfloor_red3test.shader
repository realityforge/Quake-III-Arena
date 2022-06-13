textures/sfx/pentagramfloor_red3test
{
  {
    map textures/sfx/pentagramfloor_red3test
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/pentagramfloor_red3glowtest
    depthFunc equal
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
