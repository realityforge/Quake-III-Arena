textures/base/border11light
{
  q3map_surfacelight 1000
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base/border11light
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base/border11light_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
