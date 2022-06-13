textures/sfx/zap_ball
{
  q3map_surfacelight 300
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes autoSprite
  {
    clampmap textures/sfx/zap_ball
    blendFunc add
    rgbGen wave triangle 1 2 0 7
    tcmod rotate 103
  }
  {
    clampmap textures/sfx/zap_ball2
    blendFunc add
    rgbGen wave sin 1 2 0 8
    tcmod rotate -180
  }
}
