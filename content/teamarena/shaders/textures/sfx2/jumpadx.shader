textures/sfx2/jumpadx
{
  {
    map textures/sfx2/jumpadn
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod rotate 130
  }
  {
    map textures/sfx2/fan01
    blendFunc blend
    rgbGen identity
    tcmod rotate -311
  }
  {
    clampmap textures/sfx2/jumpadn2
    blendFunc add
    rgbGen wave square .5 .5 .25 1.4
    tcmod rotate 130
    tcmod stretch sin 1.2 .8 0 1.4
  }
  {
    map textures/sfx2/jumpadx
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
