textures/eerie/light2
{
  q3map_surfacelight 4000
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/light2
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/light2_blend
    blendFunc add
  }
}
