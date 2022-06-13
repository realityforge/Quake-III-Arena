textures/base_trim/panel_glo
{
  {
    map textures/sfx/firegorre2
    blendFunc GL_ONE GL_ZERO
    rgbGen wave sin 1 1 0 .1
    tcmod turb 0 .6 0 .06
    tcmod scale .53 .61
    tcmod scroll 0 4
  }
  {
    map textures/base_trim/panel_glo
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
