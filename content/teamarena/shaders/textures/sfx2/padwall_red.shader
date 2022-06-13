textures/sfx2/padwall_red
{
  q3map_lightimage textures/sfx2/dm3padwallglow_red
  qer_editorimage textures/sfx2/dm3padwall_red
  {
    map textures/sfx2/dm3padwall_red
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx2/dm3padwallglow_red
    blendFunc add
    rgbGen wave sin 0 1 0 .5
    tcmod scale 1 .05
    tcmod scroll 0 1
  }
}
