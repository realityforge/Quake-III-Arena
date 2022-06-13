models/weaphits/proxmine2t
{
  cull disable
  nomipmaps
  {
    clampmap models/weaphits/proxmine2t
    blendFunc add
    rgbGen identity
    tcmod rotate 200
    tcmod stretch sin .6 .2 0 .11
  }
  {
    clampmap models/weaphits/proxmine2t
    blendFunc add
    rgbGen identity
    tcmod rotate -200
    tcmod stretch sin .6 .2 0 .2
  }
}
