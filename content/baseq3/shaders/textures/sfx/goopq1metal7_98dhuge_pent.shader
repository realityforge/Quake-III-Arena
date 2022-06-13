textures/sfx/goopq1metal7_98dhuge_pent
{
  {
    map textures/sfx/goopq1metal7_98dhuge_pent
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/pentagramfloor_red3_glow
    depthFunc equal
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
