textures/gothic_wall/window_evil6a
{
  q3map_surfacelight 50
  q3map_lightimage textures/gothic_wall/window_evil6a_glow
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_wall/window_evil6a
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_wall/window_evil6a_glow
    blendFunc add
    rgbGen identity
  }
}
