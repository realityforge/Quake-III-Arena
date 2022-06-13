textures/base_floor/clangspot2
{
  surfaceparm metalsteps
  {
    map textures/liquids/proto_grueldark
    blendFunc GL_ONE GL_ZERO
    tcmod scale 2 2
    tcmod scroll .01 .03
    tcmod turb 0 .05 0 .05
  }
  {
    map textures/effects/tinfx3
    blendFunc add
    tcGen environment
  }
  {
    map textures/base_floor/clangspot2
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
