textures/proto2/gear02
{
  cull disable
  surfaceparm alphashadow
  surfaceparm trans
  {
    clampmap textures/proto2/gear02
    depthWrite
    alphaFunc GE128
    rgbGen identity
    tcmod rotate 123
  }
  {
    clampmap textures/proto2/gear02b
    blendFunc add
    rgbGen identity
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
