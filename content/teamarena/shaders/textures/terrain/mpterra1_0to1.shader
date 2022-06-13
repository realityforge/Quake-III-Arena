textures/terrain/mpterra1_0to1
{
  q3map_novertexshadows
  q3map_forcesunlight
  surfaceparm nolightmap
  {
    map textures/stone/pjrock9c
    rgbGen vertex
    alphaGen vertex
    tcmod scale .125 .125
  }
  {
    map textures/stone/pjrock12c
    blendFunc blend
    rgbGen vertex
    alphaGen vertex
    tcmod scale .125 .125
  }
  {
    map textures/skies2/clouds2
    blendFunc filter
    tcmod scale .01 .01
    tcmod scroll -0.1 .1
  }
}
