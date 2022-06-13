grenadeExplosion
{
  cull disable
  {
    animMap 5 models/weaphits/glboom/glboom_1 models/weaphits/glboom/glboom_2 models/weaphits/glboom/glboom_3
    blendFunc add
    rgbGen wave inversesawtooth 0 1 0 5
  }
  {
    animMap 5 models/weaphits/glboom/glboom_2 models/weaphits/glboom/glboom_3 gfx/colors/black
    blendFunc add
    rgbGen wave sawtooth 0 1 0 5
  }
}
