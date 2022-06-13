textures/sfx/fishy
{
  tesssize 32
  cull disable
  surfaceparm nolightmap
  surfaceparm nomarks
  deformVertexes wave 10 sin 0 3 0 .5
  {
    clampmap textures/sfx/fishy
    depthWrite
    alphaFunc GE128
    tcmod stretch sin .8 .1 0 .07
  }
}
