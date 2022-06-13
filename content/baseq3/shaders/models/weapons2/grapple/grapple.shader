models/weapons2/grapple/grapple
{
  {
    map models/weapons2/grapple/grapple
    blendFunc GL_ONE GL_ZERO
    rgbGen lightingDiffuse
  }
  {
    map textures/sfx/specular
    blendFunc add
    tcGen environment
    rgbGen lightingDiffuse
    tcmod scroll .1 .1
  }
  {
    map models/weapons2/grapple/grapple
    blendFunc blend
    rgbGen lightingDiffuse
  }
}
