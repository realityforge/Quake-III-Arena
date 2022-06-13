textures/sfx/bullseye
{
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  deformVertexes autoSprite
  {
    clampmap textures/sfx/bullseye
    blendFunc add
    rgbGen identity
    tcmod stretch sin .8 .2 0 .2
    tcmod rotate 200
  }
  {
    clampmap textures/gothic_block/blocks18cgeomtrn2
    alphaFunc GE128
    rgbGen identity
    tcmod stretch sin .8 .2 0 .3
    tcmod rotate 70
  }
  {
    clampmap textures/gothic_block/blocks18cgeomtrn2
    alphaFunc GE128
    rgbGen identity
    tcmod stretch sin .8 .2 0 .2
    tcmod rotate 50
  }
  {
    clampmap textures/gothic_block/blocks18cgeomtrn2
    alphaFunc GE128
    rgbGen identity
    tcmod stretch sin .8 .2 0 .1
    tcmod rotate 30
  }
}
