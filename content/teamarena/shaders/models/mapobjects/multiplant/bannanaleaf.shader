models/mapobjects/multiplant/bannanaleaf
{
  cull disable
  nopicmip
  surfaceparm alphashadow
  {
    map models/mapobjects/multiplant/bannanaleaf
    depthWrite
    alphaFunc GE128
    blendFunc GL_ONE GL_ZERO
    rgbGen identityLighting
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
