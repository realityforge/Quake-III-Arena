textures/gothic_block/electrohell
{
  q3map_surfacelight 400
  qer_editorimage textures/gothic_block/gkc14c
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_block/gkc14c
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_block/gkc14c
    blendFunc add
  }
  {
    map textures/sfx/electro2
    blendFunc add
    rgbGen wave sin .7 .7 0 2
    tcmod rotate 1
    tcmod turb 0 .2 0 .4
    tcmod stretch sin 1 .5 0 .1
    tcmod scroll .2 .2
  }
}
