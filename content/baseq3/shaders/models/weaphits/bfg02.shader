models/weaphits/bfg02
{
  cull disable
  nomipmaps
  {
    map models/weaphits/bfg03
    blendFunc add
    rgbGen identity
    tcmod scroll 2 0
  }
  {
    map models/weaphits/bfg02
    blendFunc add
    rgbGen identity
    tcmod scroll 3 0
    tcmod turb 0 .25 0 1.6
  }
}
