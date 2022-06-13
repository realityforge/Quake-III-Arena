blur
{
  nopicmip
  nomipmaps
  {
    clampmap ui/assets/blur
    blendFunc add
    rgbGen wave sin .8 .02 0 1
    tcmod stretch sin .9 .05 0 1
    tcmod turb 1 .005 0 5
  }
}
