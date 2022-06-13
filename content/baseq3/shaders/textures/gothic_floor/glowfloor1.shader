textures/gothic_floor/glowfloor1
{
  q3map_surfacelight 600
  q3map_lightimage textures/gothicfloor/glowfloor1
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_block/blocks17g
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_floor/glowred2_blend
    blendFunc add
    rgbGen wave sin .5 .1 1 .5
  }
}
