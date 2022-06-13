textures/sfx/pitted_rust3arrowblocks
{
  q3map_surfacelight 2000
  q3map_lightimage textures/sfx/pitted_rust3arrow_blend
  qer_editorimage textures/sfx/pitted_rust3arrow
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_block/blocks17
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/pitted_rust3arrow_blend
    blendFunc add
    rgbGen wave sin .75 .25 0 1
  }
}
