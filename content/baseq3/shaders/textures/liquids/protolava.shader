textures/liquids/protolava
{
  q3map_surfacelight 600
  q3map_globaltexture
  tesssize 128
  cull disable
  surfaceparm lava
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm trans
  deformVertexes wave 100 sin 3 2 .1 .1
  {
    map textures/liquids/protolava2
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scale .2 .2
    tcmod scroll .04 .03
    tcmod turb 0 .1 0 .01
  }
  {
    map textures/liquids/protolava
    blendFunc blend
    tcmod turb 0 .2 0 .1
  }
}
