textures/ctf/red_telep
{
  cull disable
  surfaceparm nomarks
  surfaceparm trans
  {
    clampmap textures/ctf/red_telep
    blendFunc add
    rgbGen identity
    tcmod rotate 327
  }
  {
    clampmap textures/ctf/red_telep2
    blendFunc add
    rgbGen identity
    tcmod rotate -211
  }
  {
    clampmap textures/ctf/telep
    alphaFunc GE128
    rgbGen identity
    tcmod rotate 20
  }
  {
    clampmap textures/ctf/telep
    alphaFunc GE128
    rgbGen identity
    tcmod stretch sin .7 0 0 0
    tcmod rotate -20
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
