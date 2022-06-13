textures/eerie/light1
{
  q3map_surfacelight 2000
  q3map_lightimage textures/eerie/light1_blend
  q3map_flare flareshader
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/eerie/light1
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/eerie/light1_blend
    blendFunc add
  }
}
