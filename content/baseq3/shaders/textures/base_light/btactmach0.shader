textures/base_light/btactmach0
{
  q3map_surfacelight 1000
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/btactmach0
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/btactmach0_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
