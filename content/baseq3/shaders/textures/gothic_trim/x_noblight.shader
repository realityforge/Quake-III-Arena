textures/gothic_trim/x_noblight
{
  q3map_surfacelight 100
  q3map_lightimage textures/gothic_trim/x_noblightfx
  {
    map textures/sfx/firegorre2
    tcmod scroll .1 1
  }
  {
    map textures/gothic_trim/x_noblight
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
  {
    map textures/gothic_trim/x_noblightfx
    blendFunc add
    rgbGen wave sin .5 .5 0 .1
  }
}
