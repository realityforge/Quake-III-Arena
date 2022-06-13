textures/jk_dm1/jk_bouncepad_floor1
{
  q3map_surfacelight 400
  q3map_lightimage textures/jk_dm1/jk_jumppadsmall
  surfaceparm nodamage
  {
    map textures/jk_dm1/jk_bouncepad_floor1
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/jk_dm1/jk_bouncepad_layer1
    blendFunc add
    rgbGen wave sin .5 .5 0 1.5
  }
  {
    clampmap textures/jk_dm1/jk_jumppadsmall
    blendFunc add
    rgbGen wave square .5 .5 .25 1.5
    tcmod stretch sin 1.2 .8 0 1.5
  }
}
