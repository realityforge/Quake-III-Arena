textures/gothic_floor/largerblock3b_ow
{
  {
    map textures/sfx/firegorre
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scroll 0 1
    tcmod turb 0 .25 0 1.6
    tcmod scale 4 4
  }
  {
    map textures/gothic_floor/largerblock3b_ow
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}