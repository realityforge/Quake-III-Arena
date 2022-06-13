powerups/battleSuit
{
  deformVertexes wave 100 sin 1 0 0 0
  {
    map textures/effects/envmapgold2
    blendFunc add
    tcGen environment
    tcmod turb 0 .15 0 .3
    tcmod rotate 333
    tcmod scroll .3 .3
  }
}
