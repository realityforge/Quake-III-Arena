models/players/lucy/angel
{
  cull disable
  {
    map models/players/lucy/angel
    depthWrite
    alphaFunc GE128
    rgbGen lightingDiffuse
  }
  {
    map models/mapobjects/bitch/hologirl2
    blendFunc add
    tcGen environment
    rgbGen lightingDiffuse
    tcmod scroll -6 -0.2
  }
}
