railExplosion
{
  cull disable
  {
    animMap 5 models/weaphits/ring02_1 models/weaphits/ring02_2 models/weaphits/ring02_3 models/weaphits/ring02_4 gfx/colors/black
    blendFunc blend
    alphaGen wave inversesawtooth 0 1 0 5
  }
  {
    animMap 5 models/weaphits/ring02_2 models/weaphits/ring02_3 models/weaphits/ring02_4 gfx/colors/black gfx/colors/black
    blendFunc blend
    alphaGen wave sawtooth 0 1 0 5
  }
}
