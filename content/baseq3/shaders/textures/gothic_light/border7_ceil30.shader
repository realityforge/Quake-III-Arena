textures/gothic_light/border7_ceil30
{
  q3map_surfacelight 200
  q3map_lightimage textures/gothic_light/border_ceil30_blend
  qer_editorimage textures/gothic_light/border7_ceil30
  {
    map $lightmap
    rgbGen identity
  }
  {
    map textures/gothic_light/border7_ceil30
    blendFunc filter
    rgbGen identity
  }
  {
    map textures/gothic_light/border_ceil30_blend
    blendFunc add
  }
}
