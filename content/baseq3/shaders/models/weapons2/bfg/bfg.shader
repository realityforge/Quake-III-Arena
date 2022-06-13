models/weapons2/bfg/bfg
{
  {
    map textures/effects/tinfx2d
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen lightingDiffuse
    tcmod scroll .01 .01
  }
  {
    map models/weapons2/bfg/bfg
    blendFunc blend
    rgbGen lightingDiffuse
  }
  {
    map models/weapons2/bfg/bfg_glow
    blendFunc add
    rgbGen wave sin .5 .3 0 .5
  }
}
