textures/skin/proto_skin
{
  tesssize 256
  deformVertexes wave 100 sin 2 2 0 .3
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/skin/proto_skin
    blendFunc filter
    rgbGen identity
  }
}
