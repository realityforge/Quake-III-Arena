textures/gothic_block/xblocks17i_shiney
{
  qer_editorimage textures/gothic_block/xblocks17i_alpha
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_block/xblocks17i_alpha
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
