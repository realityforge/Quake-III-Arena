textures/base_wall/concrete4
{
  {
    map textures/liquids/protolava2
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scale .2 .2
    tcmod scroll .04 .03
    tcmod turb 0 .1 0 .01
  }
  {
    map textures/base_wall/concrete4
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
