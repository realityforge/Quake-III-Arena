textures/base_wall/metalfloor_wall_15ow
{
  {
    map textures/base_wall/metalfloor_wall_15ow
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
  }
  {
    map textures/sfx/hologirl
    blendFunc add
    rgbGen identity
    tcmod scale 2 .4
    tcmod scroll 6 .6
  }
  {
    map textures/base_wall/metalfloor_wall_15ow
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
  }
}
