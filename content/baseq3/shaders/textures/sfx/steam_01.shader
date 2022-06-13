textures/sfx/steam_01
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  {
    map textures/sfx/steam_01
    blendFunc add
    tcmod scale 1 .4
    tcmod scroll 0 .3
  }
  {
    map textures/sfx/steam_01
    blendFunc add
    tcmod scale -1 .2
    tcmod scroll 0 .3
  }
}
