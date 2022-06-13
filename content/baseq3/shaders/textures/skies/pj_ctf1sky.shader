textures/skies/pj_ctf1sky
{
  q3map_sun .266383 .274632 .358662 100 350 75
  q3map_surfacelight 150
  q3map_lightsubdivide 512
  q3map_globaltexture
  qer_editorimage textures/skies/pjbasesky
  skyparms full 200 -
  surfaceparm noimpact
  surfaceparm nolightmap
  {
    map textures/skies/dimclouds
    depthWrite
    tcmod scroll .015 .016
    tcmod scale 3 3
  }
  {
    map textures/skies/pjbasesky
    blendFunc add
    tcmod scroll -0.01 -0.012
    tcmod scale 5 5
  }
}
