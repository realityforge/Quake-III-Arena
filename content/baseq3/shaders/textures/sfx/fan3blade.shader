textures/sfx/fan3blade
{
  cull disable
  surfaceparm trans
  {
    clampmap textures/sfx/fan3blade
    alphaFunc GE128
    rgbGen identity
    tcmod rotate 90
  }
  {
    map $lightmap
    depthFunc equal
    blendFunc filter
    rgbGen identity
  }
}
