textures/base/q1met_redpad
{
  q3map_surfacelight 1500
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base/q1met_redpad
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base/q1met_redpad_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
