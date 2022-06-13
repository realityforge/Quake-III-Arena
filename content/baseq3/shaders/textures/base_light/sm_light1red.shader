textures/base_light/sm_light1red
{
  q3map_surfacelight 2500
  q3map_flare flareshader
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/sm_light1red
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/sm_light1red_blend
    blendFunc add
  }
}
