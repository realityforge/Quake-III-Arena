models/weaphits/proxmine
{
  cull disable
  {
    map models/weaphits/proxmine
    rgbGen lightingDiffuse
  }
  {
    map models/weaphits/proxmineb
    blendFunc add
    rgbGen wave sin .5 .5 0 2
  }
}
