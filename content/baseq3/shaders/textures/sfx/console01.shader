textures/sfx/console01
{
  q3map_surfacelight 150
  q3map_lightimage textures/sfx/console01
  qer_trans .5
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  {
    clampmap textures/sfx/console01
    blendFunc add
    tcmod rotate 20
  }
  {
    clampmap textures/sfx/console02
    blendFunc add
    tcmod rotate -200
  }
}
