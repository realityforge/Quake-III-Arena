textures/base_wall/atech1_alpha
{
  {
    map textures/sfx/hologirl
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scale 2 .4
    tcmod scroll 6 .6
  }
  {
    map textures/base_wall/atech1_alpha
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
