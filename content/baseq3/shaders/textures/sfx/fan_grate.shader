textures/sfx/fan_grate
{
  cull disable
  nopicmip
  surfaceparm metalsteps
  surfaceparm nomarks
  surfaceparm trans
  {
    map textures/sfx/fan_grate
    depthWrite
    alphaFunc GE128
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
