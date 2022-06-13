textures/base_wall2/space_concrete
{
  qer_editorimage textures/base_wall2/space_panel_alt
  {
    map textures/base_wall/concrete1
    rgbGen identity
  }
  {
    map textures/base_wall2/space_panel_alt
    blendFunc filter
    tcmod scale .25 .25
  }
  {
    map textures/base_wall2/space_panel_alt2
    blendFunc filter
    tcmod scale .25 .1
  }
  {
    map textures/base_wall2/lensflare
    blendFunc add
    tcGen environment
    rgbGen wave sin .5 0 0 0
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
