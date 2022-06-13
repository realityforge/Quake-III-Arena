textures/eerie/light3_8
{
  q3map_surfacelight 4000
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/light3_8
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/light3_8_blend
    blendFunc add
  }
}
