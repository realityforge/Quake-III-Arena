models/players/klesk/flisk_h
{
  {
    map models/players/klesk/flisk_h
    blendFunc GL_ONE GL_ZERO
    rgbGen lightingDiffuse
  }
  {
    map textures/sfx/bolts
    blendFunc add
    tcmod scale 2 2
    tcmod scroll 2 2
  }
  {
    map models/players/klesk/flisk_h
    blendFunc blend
    rgbGen lightingDiffuse
  }
}
