models/mapobjects/multiplant/batleaf2
{
  cull disable
  surfaceparm alphashadow
  deformVertexes wave 100 sin 3 5 .1 .1
  {
    map models/mapobjects/multiplant/batleaf2
    depthWrite
    alphaFunc GE128
    blendFunc GL_ONE GL_ZERO
    rgbGen identityLighting
  }
  {
    map models/mapobjects/multiplant/batleaf2veins
    blendFunc blend
    rgbGen wave sin 0 1 0 .33
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
