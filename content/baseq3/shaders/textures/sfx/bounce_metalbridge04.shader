textures/sfx/bounce_metalbridge04
{
  q3map_surfacelight 400
  q3map_lightimage textures/sfx/jumppadsmall
  surfaceparm nodamage
  {
    map textures/sfx/bounce_metalbridge04
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/bouncepad01b_layer1
    blendFunc add
    rgbGen wave sin .5 .5 0 1.5
  }
  {
    clampmap textures/sfx/jumppadsmall
    blendFunc add
    rgbGen wave square .5 .5 .25 1.5
    tcmod stretch sin 1.2 .8 0 1.5
  }
}
