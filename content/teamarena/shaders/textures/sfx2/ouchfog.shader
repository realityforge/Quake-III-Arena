textures/sfx2/ouchfog
{
  q3map_surfacelight 50
  q3map_globaltexture
  qer_editorimage textures/sfx/hellfog
  fogparms .66 0 0 392
  surfaceparm fog
  surfaceparm nodrop
  surfaceparm nolightmap
  surfaceparm nonsolid
  surfaceparm trans
  {
    map textures/sfx2/ouchfog
    blendFunc filter
    rgbGen identity
    tcmod scale -0.05 -0.05
    tcmod scroll .01 -0.01
  }
  {
    map textures/sfx2/ouchfog
    blendFunc filter
    rgbGen identity
    tcmod scale .05 .05
    tcmod scroll .01 -0.01
  }
}
