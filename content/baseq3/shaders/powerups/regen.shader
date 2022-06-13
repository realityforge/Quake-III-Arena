powerups/regen
{
  deformVertexes wave 100 sin 3 0 0 0
  {
    map textures/effects/regenmap2
    blendFunc add
    tcGen environment
    tcmod rotate 30
    tcmod scroll 1 .1
  }
}
