textures/base_trim/proto_fence
{
  cull disable
  nopicmip
  surfaceparm trans
  {
    map textures/base_trim/proto_fence
    depthWrite
    alphaFunc GE128
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scale 3 3
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
