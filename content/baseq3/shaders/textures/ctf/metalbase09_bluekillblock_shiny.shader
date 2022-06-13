textures/ctf/metalbase09_bluekillblock_shiny
{
  qer_editorimage textures/ctf/metalbase09_bluekillblock
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/ctf/metalbase09_bluekillblock
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
