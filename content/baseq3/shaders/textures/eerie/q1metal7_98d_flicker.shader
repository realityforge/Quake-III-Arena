textures/eerie/q1metal7_98d_flicker
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/q1metal7_98d
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/firewalla
    blendFunc filter
    tcmod scroll -15 -5
    tcmod scale .25 .25
    tcmod turb .2 .2 .1 1
  }
}
