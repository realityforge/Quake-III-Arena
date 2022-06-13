textures/sfx/spawnpad
{
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
    map textures/sfx/spawnpad_blend
    blendFunc add
    rgbGen wave sin .75 .25 0 .2
  }
}
