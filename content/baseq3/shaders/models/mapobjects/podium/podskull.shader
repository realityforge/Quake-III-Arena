models/mapobjects/podium/podskull
{
  {
    map models/mapobjects/podium/podskull
    blendFunc GL_ONE GL_ZERO
    rgbGen lightingDiffuse
  }
  {
    map textures/sfx/specular
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scroll .2 .03
  }
  {
    map models/mapobjects/podium/podskull
    blendFunc blend
    rgbGen lightingDiffuse
  }
  {
    map models/mapobjects/podium/podskullfx
    blendFunc add
    rgbGen wave sin 1 1 0 .2
  }
}
