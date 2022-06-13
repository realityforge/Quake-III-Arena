textures/base_floor/glowfloor3
{
  q3map_surfacelight 500
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_floor/diamond2
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_floor/glowred1_blend
    blendFunc add
    rgbGen wave sin .5 .1 1 .5
  }
}
