textures/sfx/xmetalfloor_wall_5b
{
  qer_editorimage textures/sfx/metalfloor_wall_5b
  {
    map textures/sfx/metalfloor_wall_7b
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/metalfloor_wall_5bglowblu
    blendFunc add
    rgbGen wave sin .5 .2 0 .1
  }
}
