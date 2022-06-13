textures/base_wall/glass_frame
{
  cull disable
  surfaceparm alphashadow
  {
    map textures/effects/tinfx2
    blendFunc add
    tcGen environment
    rgbGen identity
  }
  {
    map textures/base_wall/glass_frame
    depthWrite
    alphaFunc GE128
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
