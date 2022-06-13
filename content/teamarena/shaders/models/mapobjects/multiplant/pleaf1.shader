models/mapobjects/multiplant/pleaf1
{
  cull disable
  surfaceparm alphashadow
  {
    map models/mapobjects/multiplant/pleaf1
    depthWrite
    alphaFunc GE128
    blendFunc GL_ONE GL_ZERO
    rgbGen identityLighting
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
