textures/liquids/flatripplewater_1500
{
  q3map_surfacelight 500
  q3map_lightsubdivide 32
  q3map_globaltexture
  qer_editorimage textures/liquids/pool2
  cull disable
  surfaceparm lava
  surfaceparm noimpact
  surfaceparm nolightmap
  deformVertexes wave 100 sin 3 2 .1 .1
  {
    map textures/liquids/pool2
    tcmod turb 0 .2 0 .1
  }
}
