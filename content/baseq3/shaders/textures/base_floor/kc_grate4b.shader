textures/base_floor/kc_grate4b
{
  cull disable
  surfaceparm alphashadow
  surfaceparm metalsteps
  surfaceparm nonsolid
  surfaceparm trans
  {
    map textures/base_floor/kc_grate4b
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
