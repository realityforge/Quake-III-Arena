textures/eerie/border11light
{
  q3map_surfacelight 1000
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/border11light
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/border11light_blend
    blendFunc add
  }
}
