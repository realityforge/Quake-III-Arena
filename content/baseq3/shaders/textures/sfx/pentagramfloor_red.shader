textures/sfx/pentagramfloor_red
{
  polygonOffset
  {
    map textures/sfx/pentagramfloor_red
    depthWrite
    alphaFunc GT0
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/pentagramfloor_red_glow
    depthFunc equal
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
