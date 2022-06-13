textures/base_trim/panelbrn010w
{
  q3map_lightimage textures/base_trim/panelbrn010wfx
  {
    map textures/base_trim/panelbrn010w
  }
  {
    map textures/sfx/hologirl2
    blendFunc add
    rgbGen identity
    tcmod scale .4 .4
    tcmod scroll 6 2
  }
  {
    map textures/base_trim/panelbrn010w
    blendFunc blend
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
