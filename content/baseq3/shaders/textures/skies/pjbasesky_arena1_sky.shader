textures/skies/pjbasesky_arena1_sky
{
  q3map_sun .266383 .274632 .358662 150 60 85
  q3map_surfacelight 100
  q3map_lightsubdivide 256
  q3map_globaltexture
  qer_editorimage textures/skies/pjbasesky
  skyparms - 512 -
  surfaceparm noimpact
  surfaceparm nolightmap
  {
    map textures/skies/dimclouds
    depthWrite
    tcmod scroll .01 .01
    tcmod scale 3 3
  }
  {
    map textures/skies/pjbasesky
    blendFunc add
    tcmod scroll -0.01 -0.01
    tcmod scale 5 5
  }
}
