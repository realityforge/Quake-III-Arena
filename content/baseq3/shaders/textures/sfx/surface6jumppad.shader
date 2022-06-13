textures/sfx/surface6jumppad
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_stone/surface6
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/sfx/surface6jumppad_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
