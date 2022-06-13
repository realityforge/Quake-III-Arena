textures/base_floor/clang_floorshiny
{
  qer_editorimage textures/base_floor/clang_floor
  {
    map $lightmap
    tcGen environment
    tcmod scale .25 .25
  }
  {
    map textures/base_floor/clang_floorshiny_alpha
    blendFunc GL_ONE GL_SRC_ALPHA
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
