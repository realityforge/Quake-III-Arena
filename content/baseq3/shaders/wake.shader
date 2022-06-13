wake
{
  {
    clampmap sprites/splash
    blendFunc add
    rgbGen wave sin .7 .3 .25 .5
    tcmod rotate 250
    tcmod stretch sin .9 .1 0 .7
  }
  {
    clampmap sprites/splash
    blendFunc add
    rgbGen wave sin .7 .3 .25 .4
    tcmod rotate -230
    tcmod stretch sin .9 .05 0 .9
  }
}
