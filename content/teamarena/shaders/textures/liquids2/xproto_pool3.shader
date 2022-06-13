textures/liquids2/xproto_pool3
{
  q3map_surfacelight 30
  q3map_lightsubdivide 32
  q3map_globaltexture
  qer_editorimage textures/liquids2/proto_pool3
  qer_trans .8
  cull disable
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  {
    map textures/liquids2/proto_pool3
    blendFunc add
    tcmod scroll .02 .02
  }
  {
    map textures/liquids2/proto_poolpass2
    blendFunc add
    tcmod scale .5 .6
    tcmod scroll .06 .04
  }
  {
    map textures/liquids2/proto_poolpass
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
