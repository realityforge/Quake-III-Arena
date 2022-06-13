textures/skin/nibbles
{
  deformVertexes wave 10 sin 4 3 0 .3
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/skin/nibbles
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
