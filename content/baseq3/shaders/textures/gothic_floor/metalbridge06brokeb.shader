textures/gothic_floor/metalbridge06brokeb
{
  {
    map textures/sfx/kenelectric
    rgbGen identity
    tcmod scale 2 2
    tcmod turb 0 .2 0 .3
    tcmod scroll 3 5
  }
  {
    map textures/gothic_floor/metalbridge06brokeb
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
