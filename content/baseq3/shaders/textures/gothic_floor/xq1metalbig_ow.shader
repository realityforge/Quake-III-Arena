textures/gothic_floor/xq1metalbig_ow
{
  {
    map textures/gothic_floor/xq1metalbig_ow
    rgbGen identity
  }
  {
    map textures/sfx/specular
    blendFunc add
    tcGen environment
    rgbGen identity
    tcmod scale 3 3
    tcmod turb 0 .25 0 .05
  }
  {
    map textures/gothic_floor/xq1metalbig_ow
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
    rgbGen identity
  }
}
