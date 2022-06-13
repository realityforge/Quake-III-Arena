textures/base_light/cornerlight
{
  q3map_surfacelight 2500
  q3map_lightimage textures/base_light/cornerlight_glow
  surfaceparm nomarks
  {
    map textures/base_light/cornerlight
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/cornerlight_glow
    blendFunc add
    rgbGen wave sawtooth .6 .1 0 7
  }
}
