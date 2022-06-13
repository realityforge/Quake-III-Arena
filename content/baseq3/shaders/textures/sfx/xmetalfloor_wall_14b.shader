textures/sfx/xmetalfloor_wall_14b
{
  q3map_surfacelight 50
  q3map_lightimage textures/sfx/metalfloor_wall_14bglow2
  qer_editorimage textures/sfx/metalfloor_wall_14b
  {
    map textures/sfx/metalfloor_wall_14b
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/metalfloor_wall_14bglow2
    blendFunc add
  }
}
