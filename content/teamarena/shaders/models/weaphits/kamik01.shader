models/weaphits/kamik01
{
  cull disable
  {
    map models/weaphits/kamik01
    blendFunc GL_ONE GL_ZERO
    tcGen environment
    rgbGen identity
  }
  {
    map models/weaphits/kamik02
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scale .5 .5
    tcmod rotate 66
    tcmod scroll 1.3 .8
  }
  {
    map models/weaphits/kamik02
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scale .5 .5
    tcmod rotate -116
    tcmod scroll -1 .3
  }
}
