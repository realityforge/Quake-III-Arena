textures/skies/pj_arena4_sky
{
  q3map_sun .266383 .274632 .358662 200 165 45
  q3map_surfacelight 100
  q3map_lightsubdivide 512
  q3map_globaltexture
  qer_editorimage textures/skies/pjbasesky
  skyparms full - -
  surfaceparm noimpact
  surfaceparm nolightmap
  surfaceparm sky
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
