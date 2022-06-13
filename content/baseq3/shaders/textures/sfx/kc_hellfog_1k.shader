textures/sfx/kc_hellfog_1k
{
  q3map_surfacelight 300
  q3map_lightsubdivide 32
  q3map_globaltexture
  qer_editorimage textures/sfx/hellfog
  fogparms .5 .12 .1 225
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
