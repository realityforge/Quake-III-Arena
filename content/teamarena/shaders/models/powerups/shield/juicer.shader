models/powerups/shield/juicer
{
  deformVertexes wave 80 sin 0 1 0 .6
  {
    map models/powerups/shield/juicer
    blendFunc GL_ONE GL_ZERO
    rgbGen lightingDiffuse
    tcmod scale 2 2
    tcmod scroll 0 -0.1
  }
  {
    map textures/effects2/tinfx_scr
    blendFunc add
    tcGen environment
    rgbGen lightingDiffuse
  }
}
