textures/gothic_block/blocks15_sandy
{
  q3map_globaltexture
  qer_editorimage textures/gothic_block/blocks15
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_block/sand2
    detail
    blendFunc GL_DST_COLOR GL_SRC_COLOR
    rgbGen identity
    tcmod scale 2.9 2.234
  }
  {
    map textures/gothic_block/blocks15
    blendFunc filter
    rgbGen identity
    tcmod scale .25 .25
  }
}
