textures/base_light/runway
{
  q3map_surfacelight 400
  q3map_lightimage textures/base_light/runway_glow
  surfaceparm nomarks
  {
    map textures/base_light/runway_glow
    rgbGen wave square -1 2 .5 8
    tcmod scale 1 .25
    tcmod scroll 0 .5
  }
  {
    map textures/base_light/runway
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/runwayb
    blendFunc add
    rgbGen identity
  }
}
