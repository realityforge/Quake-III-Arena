railDisc
{
  cull disable
  sort nearest
  deformVertexes wave 100 sin 0 .5 0 2.4
  {
    clampmap gfx/misc/raildisc_mono2
    blendFunc add
    rgbGen vertex
    tcmod rotate -30
  }
}
