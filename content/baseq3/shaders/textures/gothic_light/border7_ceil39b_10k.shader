textures/gothic_light/border7_ceil39b_10k
{
  q3map_surfacelight 3000
  q3map_flare flareshader
  qer_editorimage textures/gothic_light/border7_ceil39b
  surfaceparm nomarks
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/border7_ceil39b
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/border7_ceil39b_blend
    blendFunc add
  }
}
