textures/common/mirror2
{
  qer_editorimage textures/common/qer_mirror
  portal
  surfaceparm nolightmap
  {
    map textures/common/mirror1
    depthWrite
    blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
  }
  {
    map textures/sfx/mirror
    blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
  }
}
