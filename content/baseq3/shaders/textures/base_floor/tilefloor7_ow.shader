textures/base_floor/tilefloor7_ow
{
  q3map_surfacelight 100
  q3map_lightimage textures/base_floor/tilefloor7_owfx
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_floor/tilefloor7_ow
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_floor/tilefloor7_owfx
    blendFunc add
    rgbGen wave triangle 1 2 0 7
  }
  {
    map textures/base_floor/tilefloor7_owfx
    blendFunc add
    rgbGen wave triangle 1 5 1 3
  }
}
