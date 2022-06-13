models/mapobjects/console/centercon
{
  cull disable
  {
    map models/mapobjects/console/scrolltext
    blendFunc add
    rgbGen vertex
    tcmod scroll 0 -0.3
  }
  {
    clampmap models/mapobjects/console/centercon
    blendFunc add
    rgbGen vertex
    tcmod stretch sin .9 .1 0 .2
    tcmod rotate 40
  }
}
