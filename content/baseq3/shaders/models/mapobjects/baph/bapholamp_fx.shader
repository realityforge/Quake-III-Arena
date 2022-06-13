models/mapobjects/baph/bapholamp_fx
{
  cull disable
  nomipmaps
  surfaceparm trans
  deformVertexes autoSprite
  {
    clampmap models/mapobjects/baph/bapholamp_fx
    blendFunc add
    rgbGen identity
    tcmod rotate 333
    tcmod stretch sin .9 .1 0 7
  }
  {
    clampmap models/mapobjects/baph/bapholamp_fx2
    blendFunc add
    rgbGen identity
    tcmod rotate -301
    tcmod stretch sin 1 .1 0 9
  }
}
