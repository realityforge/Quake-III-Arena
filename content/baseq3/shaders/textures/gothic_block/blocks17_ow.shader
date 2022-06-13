textures/gothic_block/blocks17_ow
{
  {
    map textures/sfx/firegorre
    blendFunc GL_ONE GL_ZERO
    rgbGen identity
    tcmod scroll 0 1
    tcmod turb 0 .25 0 5.6
    tcmod scale 1.5 1.5
  }
  {
    map textures/gothic_block/blocks17_ow
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
