textures/gothic_block/blocks18cgeomtrn
{
  {
    map textures/sfx/firegorre
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scroll 0 1
    tcmod turb 0 .25 0 1.6
    tcmod scale 2 2
  }
  {
    map textures/gothic_block/blocks18cgeomtrn2
    blendFunc blend
    rgbGen identity
    tcmod rotate 30
    tcmod stretch sin .8 .2 0 .2
  }
  {
    map textures/gothic_block/blocks18cgeomtrn2
    blendFunc blend
    rgbGen identity
    tcmod rotate 20
    tcmod stretch sin .8 .2 0 .1
  }
  {
    map textures/gothic_block/blocks18cgeomtrn
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
