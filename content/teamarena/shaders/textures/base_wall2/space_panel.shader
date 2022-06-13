textures/base_wall2/space_panel
{
  {
    map textures/base_wall2/space_panel
    rgbGen identity
    tcmod scale .5 .5
  }
  {
    map textures/base_wall2/space_panel_alt
    blendFunc filter
    rgbGen wave sin .5 0 0 0
  }
  {
    map textures/base_wall2/lensflare
    blendFunc add
    tcGen environment
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
