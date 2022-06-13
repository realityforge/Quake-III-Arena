textures/eerie/lavahell_goddamnbright
{
  q3map_surfacelight 7000
  tesssize 256
  qer_editorimage textures/eerie/lavahell
  qer_nocarve
  cull disable
  fogparms .8519142 .309723 0 128
  surfaceparm lava
  surfaceparm noimpact
  surfaceparm nolightmap
  deformVertexes wave 100 sin 5 5 .5 .02
  {
    map textures/eerie/lavahell
    tcmod turb .25 .2 1 .02
    tcmod scroll .1 .1
  }
}
