textures/proto2/v_support02
{
  cull disable
  nomipmaps
  surfaceparm alphashadow
  {
    map textures/proto2/v_support02
    depthWrite
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
