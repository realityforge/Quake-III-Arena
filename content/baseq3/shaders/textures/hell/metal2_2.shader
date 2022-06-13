textures/hell/metal2_2
{
  cull disable
  surfaceparm trans
  {
    map textures/hell/metal2_2
    depthWrite
    alphaFunc GE128
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
