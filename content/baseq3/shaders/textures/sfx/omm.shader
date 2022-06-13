textures/sfx/omm
{
  cull disable
  surfaceparm alphashadow
  surfaceparm nomarks
  surfaceparm trans
  {
    map textures/sfx/omm
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
