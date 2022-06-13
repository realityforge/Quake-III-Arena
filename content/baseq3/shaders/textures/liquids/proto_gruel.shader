textures/liquids/proto_gruel
{
  q3map_globaltexture
  qer_trans 80
  cull disable
  surfaceparm nomarks
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  {
    map textures/liquids/proto_gruel
    tcmod scroll .02 .02
  }
  {
    map textures/liquids/proto_gruel
    blendFunc add
    tcmod scale .5 .6
    tcmod scroll .06 .04
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
