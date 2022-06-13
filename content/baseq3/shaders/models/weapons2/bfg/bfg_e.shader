models/weapons2/bfg/bfg_e
{
  {
    map models/weapons2/bfg/envmapbfg
    rgbGen identity
    tcmod turb 0 .5 0 .1
    tcmod scale .4 .4
    tcmod scroll .2 -0.2
  }
  {
    map models/weapons2/bfg/envmapbfg
    blendFunc add
    rgbGen identity
    tcmod turb 0 .5 0 .1
    tcmod scale .2 .2
    tcmod scroll .3 .6
  }
  {
    map textures/effects/tinfx
    blendFunc add
    tcGen environment
    rgbGen lightingDiffuse
  }
}
