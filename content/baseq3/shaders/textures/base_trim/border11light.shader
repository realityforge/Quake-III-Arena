textures/base_trim/border11light
{
  q3map_surfacelight 500
  q3map_lightimage textures/base_trim/border11light_glow
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_trim/border11light
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_trim/border11light_glow
    blendFunc add
    rgbGen wave sin .9 .1 0 10
  }
}
