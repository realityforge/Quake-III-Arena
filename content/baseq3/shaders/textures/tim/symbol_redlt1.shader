textures/tim/symbol_redlt1
{
  q3map_surfacelight 100
  q3map_lightimage textures/tim/symbol_redlt1_mask
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/tim/symbol_redlt1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/tim/symbol_redlt1_mask
    blendFunc add
    rgbGen wave sawtooth .2 .05 0 7
  }
}
