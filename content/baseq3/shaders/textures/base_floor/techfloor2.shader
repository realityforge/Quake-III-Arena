textures/base_floor/techfloor2
{
  cull disable
  surfaceparm nomarks
  {
    clampmap textures/base_floor/techfloor2
    alphaFunc GE128
    rgbGen identity
    tcmod rotate 70
    tcmod stretch sin .8 .2 0 .3
  }
  {
    clampmap textures/base_floor/techfloor2
    alphaFunc GE128
    rgbGen identity
    tcmod rotate -50
    tcmod stretch sin .8 .2 0 .2
  }
  {
    clampmap textures/base_floor/techfloor2
    alphaFunc GE128
    rgbGen identity
    tcmod rotate 30
    tcmod stretch sin .8 .2 0 .1
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
