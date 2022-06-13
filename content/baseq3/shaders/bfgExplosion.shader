bfgExplosion
{
  cull disable
  {
    animMap 5 models/weaphits/bfgboom/bfgboom_1 models/weaphits/bfgboom/bfgboom_2 models/weaphits/bfgboom/bfgboom_3
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 5
  }
  {
    animMap 5 models/weaphits/bfgboom/bfgboom_2 models/weaphits/bfgboom/bfgboom_3 gfx/colors/black
    blendFunc add
    rgbGen wave sawtooth 0 1 0 5
  }
}
