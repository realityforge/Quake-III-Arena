textures/terrain/mpterra2_1to2
{
  q3map_novertexshadows
  q3map_forcesunlight
  surfaceparm nolightmap
  {
    map textures/stone/pjrock12b_2
    rgbGen vertex
    alphaGen vertex
    tcmod scale .1 .1
  }
  {
    map textures/stone/pjrock10b_2
    blendFunc blend
    rgbGen vertex
    alphaGen vertex
    tcmod scale .05 .05
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