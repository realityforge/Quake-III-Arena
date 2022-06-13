models/flags/b_flag2
{
  cull disable
  deformVertexes wave 100 sin 4 3 0 .3
  deformVertexes wave 30 sin 0 3 0 .8
  deformVertexes normal .3 .2
  {
    map models/flags/b_flag2
    rgbGen identity
  }
  {
    map models/flags/blue_fx
    blendFunc add
    tcGen environment
    rgbGen identity
  }
  {
    map models/flags/b_flag2
    blendFunc blend
    rgbGen identity
  }
  {
    map textures/sfx/shadow
    blendFunc filter
    tcGen environment
    rgbGen identity
  }
}
