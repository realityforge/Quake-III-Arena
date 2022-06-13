textures/eerie/q1metal7_98d_pent_256
{
  q3map_surfacelight 250
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/q1metal7_98d_pent_256
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/pentagramfloor_256x256
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
