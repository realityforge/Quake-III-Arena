textures/sfx/blocks11b_jumppad
{
  surfaceparm nodamage
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_block/blocks11b
    blendFunc filter
    rgbGen identity
  }
  {
    clampmap textures/sfx/jumppad
    blendFunc add
    rgbGen wave sin .75 .25 0 .2
    tcmod stretch sin .8 .2 0 1
  }
}
