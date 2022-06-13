ripplewater2_back
{
  q3map_globaltexture
  surfaceparm nolightmap
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  {
    map textures/liquids/ripplewater3
    blendFunc GL_DST_COLOR GL_SRC_COLOR
    tcGen environment
    tcmod scale .05 .05
    tcmod scroll .001 .001
  }
}
