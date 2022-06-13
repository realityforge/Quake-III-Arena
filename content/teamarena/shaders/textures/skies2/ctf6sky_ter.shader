textures/skies2/ctf6sky_ter
{
  q3map_sun 1 1 1 185 180 85
  q3map_surfacelight 300
  q3map_lightsubdivide 512
  q3map_globaltexture
  qer_editorimage textures/skies2/ctf6skyb
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  {
    map textures/skies2/ctf6sky2b
    depthWrite
    tcmod scale 3 3
    tcmod scroll .05 .05
  }
  {
    map textures/skies2/ctf6skyb
    blendFunc add
    tcmod scale 1.2 .9
    tcmod scroll .013 .002
  }
}
