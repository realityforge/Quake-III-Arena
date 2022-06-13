textures/proto2/concrete01wetfloor
{
  {
    map textures/proto2/ooze
    rgbGen identity
    tcmod scale 2 2
    tcmod turb 0 .2 0 .1
  }
  {
    map textures/proto2/concrete01wetfloor
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
