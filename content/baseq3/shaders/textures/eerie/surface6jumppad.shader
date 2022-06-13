textures/eerie/surface6jumppad
{
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/surface6
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/surface6jumppad_blend
    blendFunc add
    rgbGen wave sin .5 .5 0 .2
  }
}
