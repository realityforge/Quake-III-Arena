textures/sfx/largerblock3b3x128_pentred
{
  q3map_surfacelight 500
  q3map_lightimage textures/gothic_floor/pent_glow
  qer_editorimage textures/sfx/largerblock3b3x128_pent
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/sfx/largerblock3b3x128_pent
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_floor/pent_glow
    blendFunc add
    rgbGen wave sin .5 .5 0 .5
  }
}
