textures/sfx/blocks11b_himom
{
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
    map textures/sfx/himom
    blendFunc add
    rgbGen wave sin .75 .25 0 .5
  }
}
