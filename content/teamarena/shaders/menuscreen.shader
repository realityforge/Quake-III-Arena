menuscreen
{
  nopicmip
  nomipmaps
  {
    map textures/sfx2/screen01
    blendFunc add
    rgbGen wave square .75 .05 0 5
    tcmod scroll 7.1 .2
    tcmod scale .8 1
  }
  {
    map textures/effects2/console01
    blendFunc add
    tcmod scroll -0.01 -0.02
    tcmod scale .02 .01
    tcmod rotate 3
  }
}
