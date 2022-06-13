textures/gothic_floor/xlargeblockfloor5_pent_offset
{
  {
    map textures/gothic_floor/xlargeblockfloor5_pent_offset
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/pentfloor_256_glow
    depthFunc equal
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
