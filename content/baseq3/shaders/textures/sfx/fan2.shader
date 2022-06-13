textures/sfx/fan2
{
  cull disable
  nopicmip
  surfaceparm nomarks
  surfaceparm trans
  {
    clampmap textures/sfx/fan2
    depthWrite
    alphaFunc GT0
    blendFunc blend
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
