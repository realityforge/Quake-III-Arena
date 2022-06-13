textures/sfx/fan3
{
  cull disable
  sort 6
  surfaceparm alphashadow
  {
    map textures/sfx/fan3
    blendFunc blend
    rgbGen identity
  }
  {
    map $lightmap
    blendFunc filter
    rgbGen identity
  }
}
