textures/sfx2/jumportal01
{
  cull disable
  surfaceparm trans
  {
    map textures/sfx2/jumportal01
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
