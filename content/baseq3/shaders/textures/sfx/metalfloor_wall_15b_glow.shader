textures/sfx/metalfloor_wall_15b_glow
{
  q3map_surfacelight 100
  q3map_lightimage textures/sfx/metalfloor_wall_15bglow
  qer_editorimage textures/sfx/metalfloor_wall_15b
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/sfx/metalfloor_wall_15b
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/metalfloor_wall_15bglow
    blendFunc add
    rgbGen wave sin .1 .05 1 1
  }
}
