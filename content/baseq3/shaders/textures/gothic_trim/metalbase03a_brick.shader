textures/gothic_trim/metalbase03a_brick
{
  qer_editorimage textures/gothic_trim/metalbase03_a
  {
    map textures/gothic_wall/streetbricks10
    rgbGen identity
    tcmod scale 2 2
  }
  {
    map textures/gothic_trim/metalbase03_a
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
