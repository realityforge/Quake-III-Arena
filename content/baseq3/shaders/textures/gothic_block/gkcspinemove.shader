textures/gothic_block/gkcspinemove
{
  tesssize 128
  qer_editorimage textures/gothic_block/gkc17d
  deformVertexes bulge 3 10 1
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_block/gkc17d
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
