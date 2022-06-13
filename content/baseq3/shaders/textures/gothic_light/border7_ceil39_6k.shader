textures/gothic_light/border7_ceil39_6k
{
  q3map_surfacelight 3700
  q3map_flare flareshader
  qer_editorimage textures/gothic_light/border7_ceil39
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/border7_ceil39
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/border_ceil39_blend
    blendFunc add
  }
}
