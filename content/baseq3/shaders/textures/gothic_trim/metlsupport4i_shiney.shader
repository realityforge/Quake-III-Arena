textures/gothic_trim/metlsupport4i_shiney
{
  qer_editorimage textures/gothic_trim/xmetalsupport4i_alpha
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_trim/xmetalsupport4i_alpha
    blendFunc GL_DST_COLOR GL_SRC_ALPHA
    rgbGen identity
    alphaGen lightingSpecular
  }
}
