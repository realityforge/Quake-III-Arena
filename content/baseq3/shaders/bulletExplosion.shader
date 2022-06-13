bulletExplosion
{
  cull disable
  {
    animMap 5 models/weaphits/bullet1 models/weaphits/bullet2 models/weaphits/bullet3 gfx/colors/black
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 5
  }
  {
    animMap 5 models/weaphits/bullet2 models/weaphits/bullet3 gfx/colors/black gfx/colors/black
    blendFunc add
    rgbGen wave sawtooth 0 1 0 5
  }
}
