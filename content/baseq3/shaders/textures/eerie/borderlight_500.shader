textures/eerie/borderlight_500
{
  q3map_surfacelight 500
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
