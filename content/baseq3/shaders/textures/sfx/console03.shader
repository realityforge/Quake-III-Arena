textures/sfx/console03
{
  q3map_surfacelight 150
  q3map_lightimage textures/sfx/console03
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
    tcmod rotate -400
  }
  {
    clampmap textures/sfx/console03
    blendFunc add
    tcmod rotate 40
  }
}
