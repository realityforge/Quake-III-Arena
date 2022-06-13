textures/jk_dm1/jk_q3redflag
{
  tesssize 64
  cull disable
  surfaceparm alphashadow
  surfaceparm nomarks
  surfaceparm trans
  deformVertexes wave 30 sin 0 3 0 .2
  deformVertexes wave 100 sin 0 3 0 .7
  {
    map textures/jk_dm1/jk_q3redflag
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
