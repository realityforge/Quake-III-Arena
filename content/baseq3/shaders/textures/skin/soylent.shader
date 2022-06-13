textures/skin/soylent
{
  tesssize 64
  deformVertexes wave 100 sin 4 3 0 .3
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/skin/soylent
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
