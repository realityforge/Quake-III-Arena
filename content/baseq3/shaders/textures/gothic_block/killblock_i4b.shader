textures/gothic_block/killblock_i4b
{
  q3map_surfacelight 300
  q3map_lightimage textures/gothic_block/killblock_i4glow
  qer_editorimage textures/gothic_block/killblock_i4
  {
    map textures/gothic_block/killblock_i4
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_block/killblock_i4glow
    blendFunc add
    rgbGen wave sin .9 .1 0 .1
  }
}
