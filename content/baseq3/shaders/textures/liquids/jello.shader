textures/liquids/jello
{
  q3map_surfacelight 240
  q3map_lightimage textures/liquids/proto_pool3
  q3map_globaltexture
  surfaceparm slime
  {
    map textures/liquids/jello
    tcmod scale .5 .6
    tcmod turb .1 .25 0 -0.1
  }
  {
    map textures/liquids/jello2
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
    map textures/sfx/bolts2
    blendFunc add
    tcmod scale .2 .2
    tcmod scroll 5 5
    tcmod rotate 296
  }
}
