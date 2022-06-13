textures/gothic_button/timbutton
{
  q3map_surfacelight 10
  q3map_lightimage textures/gothic_button/timbutton2
  {
    map textures/gothic_button/timbutton
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_button/timbutton2
    blendFunc add
    rgbGen wave sin .5 .5 0 1
  }
}
