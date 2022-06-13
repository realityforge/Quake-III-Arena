textures/terrain/mpterra2_0to1
{
  q3map_novertexshadows
  q3map_forcesunlight
  surfaceparm nolightmap
  {
    map textures/stone/pjrock9b_2
    rgbGen vertex
    alphaGen vertex
    tcmod scale .125 .125
  }
  {
    map textures/stone/pjrock12b_2
    blendFunc blend
    rgbGen vertex
    alphaGen vertex
    tcmod scale .1 .1
  }
  {
    map textures/skies2/clouds
    detail
    blendFunc filter
    tcmod scale .01 .01
    tcmod scroll -0.05 .05
    tcmod transform 1 0 1 1 1 1
  }
}
