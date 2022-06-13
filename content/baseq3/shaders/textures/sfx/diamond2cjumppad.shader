textures/sfx/diamond2cjumppad
{
  q3map_surfacelight 500
  q3map_lightimage textures/sfx/jumppadsmall
  qer_editorimage textures/sfx/bouncepad01_diamond2cTGA
  surfaceparm nodamage
  {
    map textures/sfx/bouncepad01_diamond2cTGA
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
