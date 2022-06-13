models/players/uriel/uriel_h
{
  {
    map models/players/uriel/uriel_h
    blendFunc GL_ONE GL_ZERO
    rgbGen lightingDiffuse
  }
  {
    map textures/sfx/proto_zzzt
    blendFunc add
    rgbGen identity
    tcmod scroll -0.2 1
  }
  {
    map models/players/uriel/uriel_h
    blendFunc blend
    rgbGen lightingDiffuse
  }
}
