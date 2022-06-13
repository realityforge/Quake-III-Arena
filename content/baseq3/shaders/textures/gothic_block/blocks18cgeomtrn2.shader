textures/gothic_block/blocks18cgeomtrn2
{
  cull disable
  surfaceparm alphashadow
  {
    clampmap textures/gothic_block/blocks18cgeomtrn2
    alphaFunc GE128
    rgbGen identity
    tcmod rotate 40
    tcmod stretch sin .8 .2 0 .3
  }
  {
    clampmap textures/gothic_block/blocks18cgeomtrn2
    alphaFunc GE128
    rgbGen identity
    tcmod rotate 30
    tcmod stretch sin .8 .2 0 .2
  }
  {
    clampmap textures/gothic_block/blocks18cgeomtrn2
    alphaFunc GE128
    rgbGen identity
    tcmod rotate 20
    tcmod stretch sin .8 .2 0 .1
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
