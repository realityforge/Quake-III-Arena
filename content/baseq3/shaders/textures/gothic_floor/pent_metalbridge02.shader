textures/gothic_floor/pent_metalbridge02
{
  q3map_surfacelight 500
  q3map_lightimage textures/gothic_floor/pent_glow
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_floor/pent_metalbridge02
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_floor/pent_glow
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
