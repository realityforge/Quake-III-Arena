textures/sfx/fan_grate2
{
  cull disable
  nopicmip
  surfaceparm metalsteps
  surfaceparm nomarks
  surfaceparm trans
  {
    map textures/sfx/fan_grate2
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
