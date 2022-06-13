models/mapobjects/multiplant/fern
{
  cull disable
  nopicmip
  surfaceparm alphashadow
  {
    map models/mapobjects/multiplant/fern
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
