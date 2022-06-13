models/powerups/ammo/bfgammo
{
  cull disable
  {
    map textures/effects/envmapbfg
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod rotate 350
    tcmod scroll 3 1
  }
  {
    map textures/effects/tinfx2
    blendFunc add
    tcGen environment
    rgbGen identity
  }
  {
    map models/powerups/ammo/bfgammo
    blendFunc blend
    rgbGen lightingDiffuse
  }
}
