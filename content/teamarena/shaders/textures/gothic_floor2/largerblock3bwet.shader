textures/gothic_floor2/largerblock3bwet
{
  {
    map textures/gothic_floor2/largerblock3bwet
    rgbGen identity
  }
  {
    map textures/effects/tinfx2c
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scale 4 4
  }
  {
    map textures/gothic_floor2/largerblock3bwet
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
