textures/skin/chapthroatooz
{
  surfaceparm nonsolid
  {
    map textures/liquids/proto_gruel3
    rgbGen vertex
    tcmod scroll 0 .2
    tcmod scale 2 2
  }
  {
    map textures/skin/chapthroatooz
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
