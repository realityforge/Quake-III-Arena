textures/liquids/proto_pool3
{
  q3map_surfacelight 50
  q3map_globaltexture
  qer_trans .8
  cull disable
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  {
    map textures/liquids/proto_pool3
    blendFunc add
    tcmod scroll .02 .02
  }
  {
    map textures/liquids/proto_poolpass2
    blendFunc add
    tcmod scale .5 .6
    tcmod scroll .06 .04
  }
  {
    map textures/liquids/proto_poolpass
    blendFunc add
    tcmod scale .2 .2
    tcmod scroll .05 .05
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
