textures/base_wall2/blue_red_stripe
{
  q3map_surfacelight 100
  q3map_lightimage textures/base_wall2/blue_red_stripe
  {
    map textures/base_wall/chrome_env
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_wall2/blue_red_stripe
    blendFunc filter
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_wall2/blue_red_stripe
    blendFunc add
    rgbGen wave sin .25 .25 0 1
  }
}
