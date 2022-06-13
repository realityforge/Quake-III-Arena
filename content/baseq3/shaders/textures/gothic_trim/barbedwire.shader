textures/gothic_trim/barbedwire
{
  cull disable
  surfaceparm trans
  {
    map textures/gothic_trim/barbedwire
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
