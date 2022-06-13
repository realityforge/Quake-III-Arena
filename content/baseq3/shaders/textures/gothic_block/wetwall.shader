textures/gothic_block/wetwall
{
  {
    map textures/gothic_block/wetwall
    rgbGen identity
  }
  {
    map textures/gothic_block/wetwallfx
    blendFunc add
    rgbGen identity
    tcmod scroll 0 -0.1
    tcmod scale 2 .6
  }
  {
    map textures/gothic_block/wetwall
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
