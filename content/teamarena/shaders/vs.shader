vs
{
  nopicmip
  nomipmaps
  {
    clampmap ui/assets/vs
    blendFunc add
    rgbGen wave sin .25 .15 .25 1.5
    tcmod turb 1 .005 0 4.5
  }
  {
    clampmap ui/assets/vs_alt
    blendFunc add
    rgbGen wave square .75 .15 0 1
    tcmod turb 1 .005 .5 4.5
  }
}
