models/weaphits/kamikblu
{
  cull disable
  {
    map textures/effects/tinfx2d
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen identity
  }
  {
    map models/weaphits/kamik02b
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scale .5 .5
    tcmod rotate 166
    tcmod scroll 1.3 .8
  }
}
