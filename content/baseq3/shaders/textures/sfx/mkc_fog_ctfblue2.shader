textures/sfx/mkc_fog_ctfblue2
{
  q3map_surfacelight 40
  q3map_globaltexture
  qer_editorimage textures/sfx/fog_timdm1
  fogparms ( .1 .1 .3 ) 320
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
