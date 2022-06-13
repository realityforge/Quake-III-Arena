textures/liquids/proto_poolpass
{
  q3map_surfacelight 240
  q3map_lightimage textures/liquids/proto_pool3
  q3map_globaltexture
  surfaceparm slime
  {
    map textures/liquids/proto_gruel2
    tcmod scale .5 .6
    tcmod turb .1 .25 0 -0.1
  }
  {
    map textures/liquids/proto_poolpass
    blendFunc add
    tcmod scale .2 .2
    tcmod turb .1 .25 0 .07
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/bolts
    blendFunc add
    tcmod scale .2 .2
    tcmod scroll .1 .1
    tcmod rotate 290
  }
}
