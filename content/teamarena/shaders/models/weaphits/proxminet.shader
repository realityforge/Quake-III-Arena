models/weaphits/proxminet
{
  cull disable
  {
    map models/weaphits/proxmine
    rgbGen lightingDiffuse
  }
  {
    map models/weaphits/proxminebt
    blendFunc add
    rgbGen wave sin .5 .5 0 2
  }
}
