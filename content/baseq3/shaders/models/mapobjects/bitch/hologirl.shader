models/mapobjects/bitch/hologirl
{
  cull disable
  deformVertexes move 0 0 .7 sin 0 5 0 .2
  {
    map models/mapobjects/bitch/hologirl
    depthWrite
    alphaFunc GE128
    rgbGen lightingDiffuse
  }
  {
    map models/mapobjects/bitch/hologirl2
    blendFunc add
    tcGen environment
    tcmod scroll -6 -0.2
  }
}
