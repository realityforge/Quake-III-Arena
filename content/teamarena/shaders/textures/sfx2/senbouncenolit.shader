textures/sfx2/senbouncenolit
{
  q3map_lightimage textures/sfx/jumppadsmall
  qer_editorimage textures/sfx/bouncepad01block18b
  surfaceparm nodamage
  surfaceparm nomarks
  {
    map textures/sfx/bouncepad01block18b
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
