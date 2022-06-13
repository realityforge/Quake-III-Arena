textures/skies2/ctf6sky
{
  q3map_sun .266383 .274632 .358662 150 60 85
  q3map_surfacelight 100
  q3map_lightsubdivide 256
  q3map_globaltexture
  qer_editorimage textures/skies2/ctf6sky
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  {
    map textures/skies2/ctf6sky2
    depthWrite
    tcmod scale 3 3
    tcmod scroll .01 .01
  }
  {
    map textures/skies2/ctf6sky
    blendFunc add
    tcmod scale 1.2 .9
    tcmod scroll .013 .002
  }
}
