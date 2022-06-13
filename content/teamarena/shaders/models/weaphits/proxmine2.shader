models/weaphits/proxmine2
{
  cull disable
  nomipmaps
  {
    clampmap models/weaphits/proxmine2
    blendFunc add
    rgbGen identity
    tcmod rotate 200
    tcmod stretch sin .6 .2 0 .11
  }
  {
    clampmap models/weaphits/proxmine2
    blendFunc add
    rgbGen identity
    tcmod rotate -200
    tcmod stretch sin .6 .2 0 .2
  }
}
