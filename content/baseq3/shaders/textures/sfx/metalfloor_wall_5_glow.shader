textures/sfx/metalfloor_wall_5_glow
{
  q3map_lightimage textures/sfx/metalfloor_wall_5bglowblu
  qer_editorimage textures/sfx/metalfloor_wall_5_glow
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_wall/metalfloor_wall_5
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/metalfloor_wall_5_glow
    blendFunc add
    rgbGen wave sin .1 .4 1 .3
  }
}
