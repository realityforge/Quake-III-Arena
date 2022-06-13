textures/skin/proto_skin2
{
  tesssize 128
  deformVertexes bulge 3 10 1
  deformVertexes normal .1 .1
  {
    map textures/liquids/proto_gruel3
    rgbGen identity
    tcmod turb 0 .2 0 .1
    tcmod scale 2 2
  }
  {
    map textures/skin/proto_skin2
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
