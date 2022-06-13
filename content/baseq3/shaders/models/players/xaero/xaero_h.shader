models/players/xaero/xaero_h
{
  {
    map models/players/xaero/xaero_h
    blendFunc GL_ONE GL_ZERO
    rgbGen lightingDiffuse
  }
  {
    map textures/sfx/firewalla
    blendFunc add
    tcmod scroll .1 1
  }
  {
    map models/players/xaero/xaero_h
    blendFunc blend
    rgbGen lightingDiffuse
  }
}
