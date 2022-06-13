textures/gothic_wall/streetbricks10_shiny
{
  q3map_globaltexture
  sort opaque
  {
    map $lightmap
    rgbGen identity
    tcmod turb .1 .1 0 0
    tcmod scale 2 2
  }
  {
    map textures/gothic_wall/streetbricks11
    blendFunc GL_ONE GL_SRC_COLOR
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
