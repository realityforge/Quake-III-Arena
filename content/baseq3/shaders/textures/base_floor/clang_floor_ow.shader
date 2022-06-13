textures/base_floor/clang_floor_ow
{
  surfaceparm metalsteps
  {
    map textures/sfx/proto_zzztblu2
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod turb 0 .5 0 9.6
    tcmod scale 2 2
    tcmod scroll 9 5
  }
  {
    map textures/base_floor/clang_floor_ow
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
