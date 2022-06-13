textures/sfx/diamondredpad
{
  q3map_surfacelight 1500
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_floor/diamond2c
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/sfx/redpad_blend
    blendFunc add
    rgbGen wave sin .75 .25 0 1
    tcmod stretch sin .8 .2 0 1
  }
}
