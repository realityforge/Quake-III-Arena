popback
{
  nopicmip
  nomipmaps
  {
    clampmap ui/assets/popback
    blendFunc blend
  }
  {
    clampmap ui/assets/popback
    blendFunc add
    rgbGen wave sin .5 0 0 0
    tcmod rotate 10
  }
}
