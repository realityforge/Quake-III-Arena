textures/gothic_floor/pent_metalbridge06b
{
  q3map_surfacelight 500
  q3map_lightimage textures/gothic_floor/pent_glow
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_floor/pent_metalbridge06b
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_floor/pent_glow
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
