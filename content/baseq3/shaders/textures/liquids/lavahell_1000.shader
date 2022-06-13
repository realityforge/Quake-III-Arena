textures/liquids/lavahell_1000
{
  q3map_surfacelight 1000
  q3map_globaltexture
  tesssize 128
  qer_editorimage textures/liquids/lavahell
  cull disable
  surfaceparm lava
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm trans
  deformVertexes wave 100 sin 3 2 .1 .1
  {
    map textures/liquids/lavahell
    tcmod turb 0 .2 0 .1
  }
}
