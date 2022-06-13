textures/proto2/mirrorfloor
{
  qer_editorimage textures/proto2/marble02b_s
  portal
  {
    map textures/common/mirror1
    depthWrite
    blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
  }
  {
    map textures/proto2/marble02b_floor
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
