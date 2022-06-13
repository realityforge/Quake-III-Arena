textures/sfx2/r_fight01
{
  cull disable
  surfaceparm nolightmap
  surfaceparm trans
  {
    map textures/sfx2/r_fight01
    blendFunc add
    rgbGen wave sin 0 1 0 .19
    tcmod turb 0 .05 .06 .25
  }
  {
    map textures/sfx2/r_fight02
    blendFunc add
    rgbGen wave sin 0 1 0 7
    tcmod turb 0 .05 .07 .33
  }
  {
    map textures/sfx2/r_fight03
    blendFunc add
    rgbGen wave sin 0 1 0 .5
    tcmod turb 0 .07 .05 .4
  }
}
