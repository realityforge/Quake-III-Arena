textures/base_wall/protobanner_ow
{
  cull disable
  surfaceparm alphashadow
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes wave 100 sin 0 1 0 .1
  deformVertexes wave 100 sin 0 1 0 .2
  {
    map textures/base_wall/protobanner_ow
    depthWrite
    alphaFunc GE128
    rgbGen vertex
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
