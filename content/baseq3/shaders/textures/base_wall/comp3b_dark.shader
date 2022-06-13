textures/base_wall/comp3b_dark
{
  q3map_surfacelight 1
  q3map_lightimage textures/base_wall/comp3textb
  {
    map textures/base_wall/comp3textb
    rgbGen identity
    tcmod scroll 3 3
  }
  {
    map textures/base_wall/comp3env
    blendFunc add
    tcGen environment
    rgbGen wave sin .98 .02 0 5
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE
    tcGen environment
  }
  {
    map textures/base_wall/comp3b
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
