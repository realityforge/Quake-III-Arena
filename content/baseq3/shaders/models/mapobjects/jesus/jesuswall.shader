models/mapobjects/jesus/jesuswall
{
  cull disable
  deformVertexes wave 100 sin 0 .2 0 .2
  {
    map $lightmap
  }
  {
    map models/mapobjects/jesus/jesuswall
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen vertex
    alphaGen lightingSpecular
  }
}
