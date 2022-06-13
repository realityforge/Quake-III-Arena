textures/base_floor/clang_floorwet
{
  qer_editorimage textures/base_floor/clang_floor
  {
    map textures/effects/tinfx3
    tcGen environment
    rgbGen identity
  }
  {
    map textures/base_floor/clang_floorwet
    blendFunc GL_ONE GL_SRC_ALPHA
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
