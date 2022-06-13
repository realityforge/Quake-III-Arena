textures/gothic_block/blocks18cgeomtrnx
{
  {
    map textures/sfx/fireswirl2blue
    rgbGen identity
    tcmod stretch sin .8 .3 0 9.7
    tcmod rotate 333
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
    map textures/gothic_block/blocks18cgeomtrnx
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
