textures/natestah/leaf2
{
  cull disable
  surfaceparm alphashadow
  {
    map textures/natestah/leaf2
    depthWrite
    alphaFunc GE128
    rgbGen vertex
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
