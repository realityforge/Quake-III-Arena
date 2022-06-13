textures/base_light/border11light
{
  q3map_surfacelight 500
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/border11light
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/border11light_blend
    blendFunc add
  }
}
