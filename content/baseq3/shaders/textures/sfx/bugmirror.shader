textures/sfx/bugmirror
{
  qer_editorimage textures/sfx/mirrorkc
  portal
  surfaceparm nolightmap
  {
    map textures/common/mirror1
    depthWrite
    blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
  }
  {
    map textures/sfx/mirrorkc
    depthFunc equal
    blendFunc add
  }
}
