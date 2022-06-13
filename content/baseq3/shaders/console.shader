console
{
  nopicmip
  nomipmaps
  {
    map gfx/misc/console01
    blendFunc GL_ONE GL_ZERO
    tcmod scroll .02 0
    tcmod scale 2 1
  }
  {
    map gfx/misc/console02
    blendFunc add
    tcmod turb 0 .1 0 .1
    tcmod scale 2 1
    tcmod scroll .2 .1
  }
}
