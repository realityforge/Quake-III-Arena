textures/base_floor/clang_floor3blava
{
  surfaceparm nolightmap
  {
    map textures/liquids/protolava2
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scale .2 .2
    tcmod scroll .04 .03
    tcmod turb 0 .1 0 .01
  }
  {
    map textures/base_floor/clang_floor3blava
    blendFunc blend
  }
}
