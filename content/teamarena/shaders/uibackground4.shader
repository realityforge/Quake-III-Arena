uibackground4
{
  nopicmip
  nomipmaps
  {
    map ui/assets/screen02
    blendFunc GL_ONE GL_ZERO
    rgbGen wave square .5 .05 0 5
    tcmod scroll 7.1 .2
    tcmod scale .8 1
  }
  {
    map ui/assets/background3
    blendFunc add
  }
}
