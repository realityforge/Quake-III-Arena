textures/base_floor/proto_skullgrate
{
  cull disable
  nopicmip
  surfaceparm metalsteps
  surfaceparm trans
  {
    map textures/base_floor/proto_skullgrate
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
