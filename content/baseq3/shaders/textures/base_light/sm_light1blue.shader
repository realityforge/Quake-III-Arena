textures/base_light/sm_light1blue
{
  q3map_surfacelight 2500
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/sm_light1blue
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/sm_light1blue_blend
    blendFunc add
  }
}
