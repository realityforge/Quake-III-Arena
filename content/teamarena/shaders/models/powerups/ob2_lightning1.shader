models/powerups/ob2_lightning1
{
  cull disable
  deformVertexes wave 100 sin 4 3 0 .3
  deformVertexes wave 30 sin 0 3 0 .8
  deformVertexes normal .3 .2
  {
    animMap 15 models/powerups/ob2_lightn1 models/powerups/ob2_lightn2 models/powerups/ob2_lightn3 models/powerups/ob2_lightn4 models/powerups/ob2_lightn5 models/powerups/ob2_lightn6 models/powerups/ob2_lightn7 models/powerups/ob2_lightn8
    blendFunc add
    rgbGen identity
  }
}
