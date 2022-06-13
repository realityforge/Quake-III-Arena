textures/base_floor/diamond_dirty
{
  q3map_globaltexture
  qer_editorimage textures/base_floor/diamond2
  surfaceparm metalsteps
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_floor/grunge2
    detail
    blendFunc GL_DST_COLOR GL_SRC_COLOR
    rgbGen identity
    tcmod scale .0693 .0712
  }
  {
    map textures/base_floor/diamond2
    blendFunc filter
    rgbGen identity
    tcmod scale .5 .5
  }
}
