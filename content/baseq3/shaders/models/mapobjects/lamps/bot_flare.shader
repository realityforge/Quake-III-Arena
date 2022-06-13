models/mapobjects/lamps/bot_flare
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes autoSprite
  deformVertexes move 0 0 3 sin 0 5 0 .1
  deformVertexes move 2 2 0 sin 0 9 0 .05
  {
    clampmap models/mapobjects/lamps/bot_flare
    blendFunc add
    tcmod rotate 20
  }
}
