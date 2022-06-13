textures/sfx/largerblock3_pent
{
  qer_editorimage textures/gothic_floor/largerblock3_pent
  {
    map textures/gothic_floor/largerblock3_pent
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/pentagramfloor_red_glow
    depthFunc equal
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
