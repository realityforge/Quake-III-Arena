textures/sfx/hellfog_tim_dm14
{
  q3map_surfacelight 50
  q3map_globaltexture
  qer_editorimage textures/sfx/hellfog
  fogparms ( .55 .11 .1 ) 128
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
