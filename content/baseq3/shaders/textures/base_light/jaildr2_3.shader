textures/base_light/jaildr2_3
{
  q3map_surfacelight 1000
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/jaildr2_3
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/jaildr2_3_blend
    blendFunc add
  }
}
