menuback_e3
{
  nopicmip
  nomipmaps
  {
    clampmap ui/assets/radial2
    blendFunc add
    rgbGen wave sin .5 .5 0 10
    tcmod rotate 200
    tcmod scale .5 .5
  }
  {
    clampmap ui/assets/radial2
    blendFunc add
    rgbGen wave sin .5 .5 0 10
    tcmod rotate -200
    tcmod scale .5 .5
  }
}
