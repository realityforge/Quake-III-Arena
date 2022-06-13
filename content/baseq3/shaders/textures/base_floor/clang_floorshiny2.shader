textures/base_floor/clang_floorshiny2
{
  qer_editorimage textures/base_floor/clang_floor
  {
    map $lightmap
    tcGen environment
    rgbGen identity
    tcmod scale .25 .25
  }
  {
    map textures/base_floor/clang_floorshiny_alpha2
    blendFunc GL_ONE GL_SRC_ALPHA
    rgbGen identity
    alphaGen wave triangle .98 .02 0 10
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
