textures/sfx/metalfloor_wall_14b_glow
{
  q3map_surfacelight 100
  q3map_lightimage textures/sfx/metalfloor_wall_14bglow
  qer_editorimage textures/sfx/metalfloor_wall_14b
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/sfx/metalfloor_wall_14b
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/metalfloor_wall_14bglow
    blendFunc add
    rgbGen wave sin .5 .5 1 .1
  }
}
