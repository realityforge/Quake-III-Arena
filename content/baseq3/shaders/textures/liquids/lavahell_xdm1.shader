textures/liquids/lavahell_xdm1
{
  q3map_surfacelight 600
  q3map_globaltexture
  tesssize 128
  qer_editorimage textures/liquids/lavahell
  cull disable
  surfaceparm nodlight
  surfaceparm noimpact
  surfaceparm nolightmap
  deformVertexes wave 100 sin 3 2 .1 .1
  {
    map textures/liquids/lavahell
    tcmod turb 0 .2 0 .1
  }
}
