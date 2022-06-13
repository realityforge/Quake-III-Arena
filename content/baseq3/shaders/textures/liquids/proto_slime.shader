textures/liquids/proto_slime
{
  q3map_globaltexture
  cull disable
  surfaceparm nonsolid
  surfaceparm trans
  surfaceparm water
  {
    map textures/liquids/proto_slime
    depthWrite
    alphaFunc GE128
    tcmod scroll .02 .02
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
