textures/sfx/pentfloor_diamond2c
{
  qer_editorimage textures/sfx/pentfloor_diamond2c
  {
    map textures/sfx/pentfloor_diamond2c
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
