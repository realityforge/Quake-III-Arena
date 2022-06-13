textures/base_wall/symbol_bluelt1
{
  q3map_surfacelight 100
  q3map_lightimage textures/base_wall/symbol_bluelt1_mask
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_wall/symbol_bluelt1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall/symbol_bluelt1_mask
    blendFunc add
    rgbGen wave sawtooth .2 .05 0 7
  }
}
