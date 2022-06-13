textures/base_wall/main_q3abanner
{
  q3map_surfacelight 100
  q3map_lightimage textures/base_wall/main_q3abanner
  {
    map textures/base_wall/main_q3abanner
    rgbGen wave square 0 1 0 .5
  }
  {
    map textures/base_wall/comp3text
    blendFunc add
    rgbGen identity
    tcmod scroll 3 3
  }
  {
    map textures/base_wall/comp3textb
    blendFunc add
    rgbGen identity
    tcmod scroll 3 3
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc add
    tcGen environment
    rgbGen wave sin .25 0 0 0
    tcmod scale .5 .5
  }
}
