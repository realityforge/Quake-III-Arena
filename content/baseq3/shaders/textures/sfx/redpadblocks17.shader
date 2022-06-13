textures/sfx/redpadblocks17
{
  q3map_surfacelight 2000
  q3map_lightimage textures/sfx/redpad_blend
  qer_editorimage textures/sfx/redpad
  surfaceparm nodamage
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
    clampmap textures/sfx/redpad_blend
    blendFunc add
    rgbGen wave sin .75 .25 0 1
    tcmod stretch sin .8 .2 0 1
  }
}
