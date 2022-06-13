models/weapons/proxmine/proxmine
{
  cull disable
  {
    map models/weapons/proxmine/proxmine
    rgbGen lightingDiffuse
  }
  {
    map models/weapons/proxmine/proxmineb
    blendFunc add
    rgbGen wave sin .5 .5 0 2
  }
}
