lightningBoltNewNPM
{
  cull disable
  nopicmip
  {
    map gfx/misc/lightning3newNPM
    blendFunc add
    rgbGen wave sin 1 .5 0 7.1
    tcmod scale 2 1
    tcmod scroll -5 0
  }
  {
    map gfx/misc/lightning3newNPM
    blendFunc add
    rgbGen wave sin 1 .8 0 8.1
    tcmod scale -1.3 -1
    tcmod scroll -7.2 0
  }
}
