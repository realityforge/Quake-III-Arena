textures/proto2/redtrim01
{
  qer_editorimage textures/proto2/bluetrim01
  {
    map textures/effects2/envmap_red
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scale .025 .05
    tcmod scroll .005 .04
  }
  {
    map textures/proto2/bluetrim01
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
