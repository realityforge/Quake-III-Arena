textures/sfx/mkc_fog_ctfred
{
  q3map_globaltexture
  qer_editorimage textures/sfx/fog_timdm1
  fogparms ( .3 .2 .2 ) 320
  surfaceparm fog
  surfaceparm nodrop
  surfaceparm nolightmap
  surfaceparm nonsolid
  surfaceparm trans
  {
    map textures/liquids/kc_fogcloud3
    blendFunc filter
    rgbGen identity
    tcmod scale -0.05 -0.05
    tcmod scroll .01 -0.01
  }
  {
    map textures/liquids/kc_fogcloud3
    blendFunc filter
    rgbGen identity
    tcmod scale .05 .05
    tcmod scroll .01 -0.01
  }
}
