textures/gothic_floor/center2trn
{
  {
    map textures/sfx/fireswirl2
    rgbGen identity
    tcmod rotate 333
    tcmod stretch sin .8 .2 0 9.7
  }
  {
    map textures/gothic_floor/center2trn
    blendFunc blend
    rgbGen identity
    tcmod rotate 30
    tcmod stretch sin .8 .2 0 .2
  }
  {
    map textures/gothic_floor/center2trn
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
