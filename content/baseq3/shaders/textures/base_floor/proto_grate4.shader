textures/base_floor/proto_grate4
{
  cull disable
  nopicmip
  surfaceparm metalsteps
  surfaceparm nonsolid
  surfaceparm trans
  {
    map textures/base_floor/proto_grate4
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
