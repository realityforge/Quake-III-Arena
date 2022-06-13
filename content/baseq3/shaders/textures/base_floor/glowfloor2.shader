textures/base_floor/glowfloor2
{
  q3map_surfacelight 800
  q3map_lightimage base_floor/glowfloor2
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_wall/metalfloor_wall_15
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_floor/glowred1_blend
    blendFunc add
    rgbGen wave sin .5 .1 1 .5
  }
}
