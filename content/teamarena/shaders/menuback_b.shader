menuback_b
{
  nopicmip
  nomipmaps
  {
    map ui/assets/menuback_b
    blendFunc add
    rgbGen wave sin .75 0 0 0
    tcmod scroll 0 .2
  }
  {
    map textures/effects2/console01
    blendFunc add
    tcmod scroll -0.01 -0.02
    tcmod scale .02 .01
    tcmod rotate 3
  }
}
