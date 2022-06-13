textures/base_wall2/blue_metal
{
  {
    map textures/base_wall/chrome_env2
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_wall2/blue_metal
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
