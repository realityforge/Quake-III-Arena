textures/base_light/steedmetallight
{
  q3map_surfacelight 2000
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/steedmetallight
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/steedmetallight_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
