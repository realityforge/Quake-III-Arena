textures/base_button/shootme2
{
  q3map_surfacelight 1000
  q3map_lightimage textures/base_button/shootme_glow
  q3map_flare flareshader
  qer_editorimage textures/base_button/shootme1
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_support/metal3_3
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_button/shootme_glow
    blendFunc add
    rgbGen wave sin .5 1 0 .3
  }
}
