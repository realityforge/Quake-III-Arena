textures/proto2/supportctfred
{
  {
    map textures/effects2/envmap_red
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scale .025 .05
    tcmod scroll .005 .02
  }
  {
    map textures/proto2/supportctfred
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
