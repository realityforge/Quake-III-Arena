textures/base_light/lt6_2p5k
{
  q3map_surfacelight 5000
  q3map_flare flareshader
  qer_editorimage textures/base_light/light6
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/base_light/light6
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/base_light/light6_blend
    blendFunc add
  }
}
