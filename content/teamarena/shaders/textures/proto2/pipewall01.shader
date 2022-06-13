textures/proto2/pipewall01
{
  cull disable
  surfaceparm alphashadow
  {
    map textures/proto2/pipewall01
    alphaFunc GE128
    rgbGen identity
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
