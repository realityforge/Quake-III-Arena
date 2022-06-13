textures/terrain/mpterra2_1
{
  q3map_novertexshadows
  q3map_forcesunlight
  surfaceparm nolightmap
  {
    map textures/stone/pjrock12b_2
    rgbGen vertex
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
