models/mapobjects/flag/banner_strgg
{
  cull disable
  sort banner
  surfaceparm alphashadow
  surfaceparm nolightmap
  deformVertexes wave 100 sin 0 3 0 .7
  {
    map models/mapobjects/flag/banner_strgg
    alphaFunc GE128
    blendFunc blend
    rgbGen vertex
  }
}
