textures/base_support/x_support4
{
  cull disable
  nopicmip
  surfaceparm alphashadow
  surfaceparm metalsteps
  surfaceparm nomarks
  surfaceparm trans
  {
    map textures/base_support/x_support4
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
