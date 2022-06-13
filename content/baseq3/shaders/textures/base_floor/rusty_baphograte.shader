textures/base_floor/rusty_baphograte
{
  cull disable
  nopicmip
  surfaceparm metalsteps
  surfaceparm trans
  {
    map textures/base_floor/rusty_baphograte
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
  {
    map textures/base_floor/rusty_baphograte2
    blendFunc add
    rgbGen wave inversesawtooth 0 1 .2 .5
  }
  {
    map textures/base_floor/rusty_baphograte3
    blendFunc add
    rgbGen wave inversesawtooth 0 1 .4 .5
  }
}
