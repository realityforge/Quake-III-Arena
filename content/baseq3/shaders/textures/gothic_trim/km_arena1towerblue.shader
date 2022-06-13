textures/gothic_trim/km_arena1towerblue
{
  {
    map textures/effects/tinfx
    tcGen environment
    rgbGen identity
  }
  {
    map textures/gothic_trim/km_arena1towerblue
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
