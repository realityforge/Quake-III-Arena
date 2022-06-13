textures/sfx/xian_dm3padwall
{
  q3map_surfacelight 100
  q3map_lightimage textures/sfx/xian_dm3padwallglow
  qer_editorimage textures/sfx/xian_dm3padwall
  {
    map textures/sfx/xian_dm3padwall
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/xian_dm3padwallglow
    blendFunc add
    rgbGen wave sin 0 1 0 .5
    tcmod scale 1 .05
    tcmod scroll 0 1
  }
}
