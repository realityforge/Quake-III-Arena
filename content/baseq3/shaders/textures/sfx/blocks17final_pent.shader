textures/sfx/blocks17final_pent
{
  qer_editorimage textures/sfx/blocks17final_pent
  {
    map textures/sfx/blocks17final_pent
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
