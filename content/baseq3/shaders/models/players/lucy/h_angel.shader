models/players/lucy/h_angel
{
  cull disable
  {
    map models/players/lucy/h_angel
    depthWrite
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
