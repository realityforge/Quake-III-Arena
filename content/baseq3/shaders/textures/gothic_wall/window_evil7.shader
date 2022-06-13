textures/gothic_wall/window_evil7
{
  q3map_surfacelight 300
  q3map_lightimage textures/gothic_wall/window_evil7_glow
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_wall/window_evil7
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_wall/window_evil7_glow
    blendFunc add
    rgbGen identity
  }
}
