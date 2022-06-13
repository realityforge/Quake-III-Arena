textures/sfx/fan
{
  cull disable
  nopicmip
  surfaceparm nomarks
  surfaceparm trans
  {
    clampmap textures/sfx/fan
    depthWrite
    alphaFunc GE128
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod rotate 256
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
