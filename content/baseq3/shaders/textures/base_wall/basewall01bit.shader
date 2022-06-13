textures/base_wall/basewall01bit
{
  q3map_surfacelight 300
  q3map_lightimage textures/base_wall/basewall01bitfx
  {
    map textures/base_wall/basewall01bit
    rgbGen identity
  }
  {
    map textures/base_wall/basewall01bitfx
    blendFunc add
    rgbGen wave sin .5 .5 0 5
    tcmod scroll 3.3 1
  }
  {
    map textures/effects/envmap2
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scale 4 4
  }
  {
    map textures/base_wall/basewall01bit
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
