textures/gothic_block/blocks15_ow
{
  {
    map textures/liquids/proto_grueldark
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scroll 0 -0.05
    tcmod scale 4 4
  }
  {
    map textures/liquids/proto_grueldark
    blendFunc add
    rgbGen identity
    tcmod scroll .01 -0.02
    tcmod scale 4 4
  }
  {
    map textures/gothic_block/blocks15_ow
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
