models/weapons2/grapple/grapple_j
{
  cull disable
  {
    map models/weapons2/grapple/grapple_j
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod turb 0 .5 0 .7
    tcmod scroll 1 -1
    tcmod scale .5 .5
  }
  {
    map textures/liquids/jello2
    blendFunc add
    rgbGen identity
    tcmod scale .7 .7
    tcmod turb 0 .4 0 .3
    tcmod scroll .7 -0.4
  }
  {
    map textures/effects/tinfx2
    blendFunc add
    tcGen environment
    rgbGen lightingDiffuse
  }
}
