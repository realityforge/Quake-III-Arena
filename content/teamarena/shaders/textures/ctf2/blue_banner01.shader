textures/ctf2/blue_banner01
{
  cull disable
  surfaceparm alphashadow
  {
    map textures/ctf2/blue_banner01
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
  {
    map textures/ctf2/b_dummy
    blendFunc add
    rgbGen wave sin 1 .5 0 .5
  }
}
