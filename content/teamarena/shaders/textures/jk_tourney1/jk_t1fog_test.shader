textures/jk_tourney1/jk_t1fog_test
{
  qer_editorimage textures/jk_tourney1/jk_t1fog_test
  fogparms ( .85 .1 .01 ) 980
  surfaceparm fog
  surfaceparm nodrop
  surfaceparm nolightmap
  surfaceparm nonsolid
  surfaceparm trans
  {
    map textures/jk_tourney1/jkt1_fogcloud3_test
    blendFunc filter
    rgbGen identity
    tcmod scale -0.05 -0.05
    tcmod scroll .01 -0.01
  }
  {
    map textures/jk_tourney1/jkt1_fogcloud3_test
    blendFunc filter
    rgbGen identity
    tcmod scale .05 .05
    tcmod scroll .01 -0.01
  }
}
