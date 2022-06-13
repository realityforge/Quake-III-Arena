models/flags/flagtest
{
  cull disable
  deformVertexes wave 100 sin 4 3 0 .3
  deformVertexes wave 30 sin 0 3 0 .8
  deformVertexes normal .2 .2
  {
    map models/flags/flagtest
    rgbGen identity
  }
  {
    map textures/sfx/shadow
    blendFunc filter
    tcGen environment
    rgbGen identity
  }
}
