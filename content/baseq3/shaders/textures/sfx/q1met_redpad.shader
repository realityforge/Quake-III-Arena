textures/sfx/q1met_redpad
{
  q3map_surfacelight 1000
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/sfx/q1met_redpad
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/q1met_redpad_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
