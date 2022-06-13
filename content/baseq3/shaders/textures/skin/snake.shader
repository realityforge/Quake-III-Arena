textures/skin/snake
{
  tesssize 128
  deformVertexes wave 100 sin 0 2 0 .3
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/skin/snake
    blendFunc filter
    rgbGen identity
  }
}
