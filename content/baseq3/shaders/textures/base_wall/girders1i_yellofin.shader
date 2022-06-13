textures/base_wall/girders1i_yellofin
{
  cull disable
  nopicmip
  surfaceparm alphashadow
  surfaceparm metalsteps
  surfaceparm nomarks
  surfaceparm nonsolid
  surfaceparm playerclip
  surfaceparm trans
  {
    map textures/base_wall/girders1i_yellodark_fin
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
