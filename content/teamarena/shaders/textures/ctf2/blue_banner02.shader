textures/ctf2/blue_banner02
{
  cull disable
  surfaceparm alphashadow
  {
    map textures/ctf2/blue_banner02
    depthWrite
    alphaFunc GE128
    rgbGen identity
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
