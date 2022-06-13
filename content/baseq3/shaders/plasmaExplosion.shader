plasmaExplosion
{
  cull disable
  {
    clampmap models/weaphits/plasmaboom
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 1.5
    tcmod stretch triangle .6 .1 0 8
    tcmod rotate 999
  }
}
