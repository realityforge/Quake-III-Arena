textures/base_light/shi
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  surfaceparm trans
  {
    map textures/base_light/shi
    blendFunc add
    rgbGen wave triangle 1 5.1 1 3
    tcmod scale .5 .5
  }
  {
    map textures/base_light/shi
    blendFunc add
    rgbGen wave triangle 1 2 0 7.3
    tcmod scale .5 .5
  }
}
