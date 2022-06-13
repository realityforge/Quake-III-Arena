models/mapobjects/podium/podium
{
  {
    map models/mapobjects/podium/podium
    blendFunc GL_ONE GL_ZERO
    rgbGen lightingDiffuse
  }
  {
    map textures/sfx/specular
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scroll .2 .01
  }
  {
    map models/mapobjects/podium/podium
    blendFunc blend
    rgbGen lightingDiffuse
  }
  {
    map models/mapobjects/podium/podiumglo
    blendFunc add
    rgbGen wave sin 1 1 0 .2
  }
}
