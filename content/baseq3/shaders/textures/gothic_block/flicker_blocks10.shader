textures/gothic_block/flicker_blocks10
{
  qer_editorimage textures/gothic_block/blocks10
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_block/blocks10
    blendFunc filter
    rgbGen wave noise .75 .25 0 10
  }
}
