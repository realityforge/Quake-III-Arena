textures/sfx/blocks18ccomputer_offset
{
  q3map_surfacelight 200
  q3map_lightimage textures/sfx/computer8
  surfaceparm nodamage
  {
    map textures/sfx/blocks18ccomputer_offset
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/computer8
    blendFunc add
    rgbGen wave sin .5 .3 0 3
  }
}
