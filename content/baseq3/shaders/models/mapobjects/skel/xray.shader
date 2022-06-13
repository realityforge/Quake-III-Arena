models/mapobjects/skel/xray
{
  q3map_surfacelight 300
  cull disable
  deformVertexes move 0 0 .7 sin 0 5 0 .2
  {
    map models/mapobjects/skel/xray
    blendFunc add
    rgbGen wave sin 1 .8 0 .3
  }
  {
    map models/mapobjects/bitch/hologirl2
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scroll -6 -0.2
  }
}
