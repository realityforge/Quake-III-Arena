models/mapobjects/grenadel/grenadelx
{
  cull disable
  nopicmip
  surfaceparm nomarks
  surfaceparm trans
  {
    clampmap models/mapobjects/grenadel/grenadelx
    depthWrite
    alphaFunc GE128
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod rotate 10
  }
}
