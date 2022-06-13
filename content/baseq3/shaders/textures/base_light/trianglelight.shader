textures/base_light/trianglelight
{
  q3map_surfacelight 2500
  q3map_lightimage textures/base_light/trianglelight_blend
  surfaceparm nomarks
  {
    map textures/base_light/trianglelight
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/trianglelight_blend
    blendFunc add
    rgbGen wave sawtooth .6 .1 0 7
  }
}
