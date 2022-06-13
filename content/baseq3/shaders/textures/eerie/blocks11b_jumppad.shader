textures/eerie/blocks11b_jumppad
{
  q3map_surfacelight 250
  surfaceparm nodamage
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/castle/blocks11b
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/eerie/jumppad
    blendFunc add
    rgbGen wave sin .75 .25 0 .2
  }
}
