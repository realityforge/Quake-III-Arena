textures/tim/rconcrete_ow
{
  {
    map textures/tim/proto_zzztred
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod turb 0 .5 0 9.6
    tcmod scale 2 2
    tcmod scroll 9 5
  }
  {
    map textures/tim/rconcrete_ow
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
